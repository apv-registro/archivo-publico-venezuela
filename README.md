# Archivo Público Venezuela

Archivo Público Venezuela (APV) preserva y organiza evidencia pública sobre
eventos institucionales venezolanos. Su estructura enlaza cada evento con los
actos concretos que lo componen y cada acto con las personas, instituciones,
documentos y afirmaciones verificables correspondientes.

## Estado actual

Piloto público. El primer expediente examina la elección presidencial de 2024.

El procedimiento editorial obligatorio está publicado en
[`policies/SOP.md`](policies/SOP.md). Define cómo abrir un evento, separar sus
actos, preservar fuentes, formular afirmaciones atómicas, comparar una actuación
con la norma aplicable e identificar responsabilidades sin exceder la evidencia.

## Principios técnicos y editoriales

- Sitio estático: sin base de datos, cookies, analítica ni cuentas de usuarios.
- Toda evidencia publicada se conserva localmente, sin alteraciones, y se
  identifica mediante SHA-256 y un manifiesto de procedencia.
- Prensa, observadores y análisis se usan para investigación, pero no integran
  la evidencia preservada de un acto.
- Cada afirmación material debe indicar una fuente y una localización precisa.
- La atribución personal distingue presencia, autoría, firma, voto, ejecución y
  mando; un cargo por sí solo no prueba participación en un acto.
- El conjunto de datos es portátil y puede ser replicado independientemente.
- No se publican domicilios, contactos privados, familiares ni vínculos
  especulativos.

## Estructura

```text
events/      Eventos y conclusiones provisionales sustentadas
acts/        Actos concretos que componen cada evento
entities/    Registros estables de personas e instituciones
documents/   Documentos oficiales preservados
analysis/    Cálculos derivados reproducibles y sus limitaciones
schemas/     Reglas de validación de los datos
site/        Sitio público estático
policies/    SOP, correcciones, seguridad y manejo de fuentes
exports/     Conjuntos derivados en JSONL y CSV
```

## Publicación

La primera versión se publica desde una cuenta independiente del proyecto en
GitHub Pages. Un espejo adicional puede añadirse cuando exista capacidad para
mantenerlo. La creación y recuperación de cuentas sigue `policies/OPSEC.md`.
