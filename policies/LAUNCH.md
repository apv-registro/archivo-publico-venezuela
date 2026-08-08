# One-person launch plan

## Chosen architecture

| Component | Initial choice | Reason |
|---|---|---|
| Source host | GitHub public repository | Familiar, widely cloned, free, and easy for researchers to reuse |
| Website | GitHub Pages | Static, free, no server administration |
| Mirror | Codeberg after first release | Independent clone and Pages option |
| Domain | None initially | Avoids registration, payment, DNS, and recovery linkage |
| Database | Versioned JSON files | Portable, reviewable, and reproducible |
| Search | Client-side generated index | No server logs or hosted database |
| Documents | Small files in Git; large files in releases plus independent archive | Keeps the repository usable |
| Submissions | Disabled | Prevents unsafe intake before a review system exists |

The entire public site must be rebuildable from the repository. Neither GitHub
nor Codeberg is trusted as the sole archive.

## Project accounts

Create only these accounts for the first release:

1. One project-only email account.
2. One GitHub account under the project identity.

Do not create an organization, domain, donation account, social media account,
or additional mirrors until the first evidence package is complete. Each extra
account adds recovery records and opportunities for accidental linkage.

## Account names

Working display name: **Archivo Público Venezuela**  
Working short name: **APV**

Candidate handles, in preferred order:

1. `archivo-publico-ve`
2. `archivo-publico-venezuela`
3. `apv-evidencia`

Availability must be checked from the separated environment immediately before
registration. A reserved handle is not worth weakening account separation.

## Required repository settings

- Public repository named `archivo-publico-venezuela`.
- Default branch protected from force-push and deletion.
- GitHub Pages published from a generated `site` artifact or dedicated branch.
- Issues disabled initially; no discussions or wiki.
- Secret scanning and dependency alerts enabled where available.
- No third-party applications, analytics, webhooks, or automation secrets.
- Project-specific no-reply email used for all commits.
- TOTP enabled and recovery codes stored offline.

## Launch gates

The repository remains private/local until all are true:

- Account separation checklist completed.
- Schemas validate all records.
- The first evidence package includes original source, hash, retrieval time, and
  exact page or paragraph references.
- Every named person's role is supported by the primary document.
- The site clearly distinguishes fact, attributed assessment, and analysis.
- A correction method exists that does not reveal the maintainer's identity.
- A clean clone can rebuild the website without private files or credentials.

