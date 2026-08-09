$ErrorActionPreference = 'Stop'

$repo = Split-Path -Parent $PSScriptRoot
$manifest = Get-Content (Join-Path $repo 'documents/manifest.json') -Encoding UTF8 -Raw | ConvertFrom-Json
$inventory = Get-Content (Join-Path $repo 'site/data/document-person-inventory.json') -Encoding UTF8 -Raw | ConvertFrom-Json
$people = Get-Content (Join-Path $repo 'site/data/people.json') -Encoding UTF8 -Raw | ConvertFrom-Json
$matrix = Get-Content (Join-Path $repo 'site/data/act-document-matrix.json') -Encoding UTF8 -Raw | ConvertFrom-Json
$errors = [System.Collections.Generic.List[string]]::new()

function Add-Error([string]$message) {
    $errors.Add($message)
}

function Find-Duplicates($values) {
    @($values | Group-Object | Where-Object Count -gt 1 | ForEach-Object Name)
}

foreach ($id in Find-Duplicates $manifest.records.id) { Add-Error "Identificador de manifiesto duplicado: $id" }
foreach ($file in Find-Duplicates $manifest.records.file) { Add-Error "Archivo de manifiesto duplicado: $file" }
foreach ($id in Find-Duplicates $inventory.document_id) { Add-Error "Inventario documental duplicado: $id" }
foreach ($id in Find-Duplicates $people.id) { Add-Error "Perfil duplicado: $id" }
foreach ($name in Find-Duplicates $people.name) { Add-Error "Nombre canónico duplicado: $name" }
foreach ($pair in Find-Duplicates ($matrix | ForEach-Object { "$($_.act_id)|$($_.document_id)" })) { Add-Error "Relación acto-documento duplicada: $pair" }

$manifestById = @{}
foreach ($record in $manifest.records) {
    $manifestById[$record.id] = $record
    $path = Join-Path (Join-Path $repo 'documents') $record.file
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Error "Archivo ausente: $($record.id) -> $($record.file)"
        continue
    }
    $file = Get-Item -LiteralPath $path
    if ($file.Length -ne $record.bytes) { Add-Error "Tamaño incorrecto: $($record.id)" }
    $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($hash -ne $record.sha256) { Add-Error "SHA-256 incorrecto: $($record.id)" }
}

$inventoryById = @{}
foreach ($document in $inventory) {
    $inventoryById[$document.document_id] = $document
    if (-not $manifestById.ContainsKey($document.document_id)) {
        Add-Error "Inventario sin registro en manifiesto: $($document.document_id)"
        continue
    }
    if ($document.file -ne $manifestById[$document.document_id].file) {
        Add-Error "Archivo discordante en inventario: $($document.document_id)"
    }
    if ($document.review_status -ne 'reviewed') { Add-Error "Revisión nominal abierta: $($document.document_id)" }
    if ([string]::IsNullOrWhiteSpace($document.scope_note)) { Add-Error "Falta alcance de revisión: $($document.document_id)" }
}
foreach ($record in $manifest.records) {
    if (-not $inventoryById.ContainsKey($record.id)) { Add-Error "Registro sin inventario nominal: $($record.id)" }
}

$peopleById = @{}
foreach ($person in $people) { $peopleById[$person.id] = $person }
foreach ($document in $inventory) {
    foreach ($appearance in $document.people) {
        if (-not $peopleById.ContainsKey($appearance.person_id)) {
            Add-Error "Persona sin perfil: $($document.document_id) -> $($appearance.person_id)"
        }
        foreach ($field in 'printed_name','locator','relation') {
            if ([string]::IsNullOrWhiteSpace($appearance.$field)) {
                Add-Error "Campo $field vacío: $($document.document_id) -> $($appearance.person_id)"
            }
        }
    }
}

foreach ($actFile in Get-ChildItem (Join-Path $repo 'acts') -Filter '*.json') {
    $act = Get-Content $actFile.FullName -Encoding UTF8 -Raw | ConvertFrom-Json
    foreach ($evidence in $act.evidence_records) {
        if ($evidence.preservation_status -ne 'missing' -and -not $manifestById.ContainsKey($evidence.id)) {
            Add-Error "Evidencia preservada fuera del manifiesto: $($act.id) -> $($evidence.id)"
        }
        $mapping = @($matrix | Where-Object { $_.act_id -eq $act.id -and $_.document_id -eq $evidence.id })
        if ($mapping.Count -ne 1) { Add-Error "Falta correspondencia única acto-documento: $($act.id) -> $($evidence.id)" }
    }
    foreach ($person in $act.persons) {
        if (-not $peopleById.ContainsKey($person.id)) { Add-Error "Persona de acto sin perfil: $($act.id) -> $($person.id)" }
    }
}

foreach ($eventFile in Get-ChildItem (Join-Path $repo 'events') -Filter '*.json') {
    $event = Get-Content $eventFile.FullName -Encoding UTF8 -Raw | ConvertFrom-Json
    foreach ($evidenceId in $event.evidence) {
        if (-not $manifestById.ContainsKey($evidenceId)) { Add-Error "Evidencia de evento fuera del manifiesto: $($event.id) -> $evidenceId" }
    }
}

foreach ($html in Get-ChildItem (Join-Path $repo 'site') -Filter '*.html' -Recurse) {
    $content = Get-Content $html.FullName -Encoding UTF8 -Raw
    foreach ($match in [regex]::Matches($content, 'href="([^"]+)"')) {
        $href = $match.Groups[1].Value
        if ($href -match '^(https?:|mailto:|#)') { continue }
        $relative = ($href -split '#')[0] -split '\?'
        $target = [System.IO.Path]::GetFullPath((Join-Path $html.DirectoryName $relative[0]))
        $deployedDocuments = Join-Path (Join-Path $repo 'site') 'documents'
        if ($target.StartsWith($deployedDocuments, [System.StringComparison]::OrdinalIgnoreCase)) {
            $suffix = $target.Substring($deployedDocuments.Length).TrimStart([char]'\', [char]'/')
            $target = Join-Path (Join-Path $repo 'documents') $suffix
        }
        if (-not (Test-Path -LiteralPath $target)) { Add-Error "Enlace local roto: $($html.FullName) -> $href" }
    }
}

if ($errors.Count) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Archivo válido: $($manifest.records.Count) documentos, $($people.Count) perfiles y $($inventory.Count) inventarios revisados."
