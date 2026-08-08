# Archivo Público Venezuela

Archivo Público Venezuela (APV) is a preservation-first collection of official
Venezuelan public acts and the public officials who participated in them.

The project records documents, provenance, institutional roles, and reproducible
analysis. It does not treat inclusion as a criminal conviction, sanctions
designation, or finding of corruption.

## Current status

Pre-publication foundation. No external accounts are connected and no material
has been published.

## Design constraints

- One maintainer and no operating budget.
- Static files only: no database server, cookies, analytics, or user accounts.
- Primary documents are preserved byte-for-byte and identified by SHA-256.
- Every factual claim must point to an exact source and location.
- Facts, attributed assessments, and project analysis remain separate.
- The public dataset is portable and can be mirrored without permission.
- No private addresses, private contact details, relatives, or speculative links.

## Repository layout

```text
cases/       One directory per official act or event
entities/    Stable records for people and institutions
documents/   Preservation manifests; document binaries may use release storage
schemas/     Machine-readable validation rules
site/        Generated static public site
policies/    Inclusion, corrections, security, and source-handling rules
exports/     Generated JSONL and CSV datasets
```

## Launch decision

The initial public release should use a new project-only GitHub account and a
public repository with GitHub Pages. A Codeberg mirror can be added after the
first release. A custom domain is deliberately postponed because registration,
payment, DNS, and recovery records add identity-linking surfaces.

Account creation must follow `policies/OPSEC.md`. Do not create the account from
an existing personal browser profile or reuse any email address, username,
password, recovery method, SSH key, avatar, biography, or commit identity.

