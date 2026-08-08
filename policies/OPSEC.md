# Maintainer separation procedure

## Honest security objective

The objective is strong separation between the maintainer's ordinary identity
and the public project identity. It is risk reduction, not a promise of perfect
anonymity. Hosting providers can retain connection and account records; device
compromise, behavioral correlation, legal process, or operational mistakes can
defeat the separation.

## Stop conditions

Do not create or access project accounts if any of these is true:

- You are signed into a personal browser, email, Git host, password manager, VPN,
  cloud-sync service, or social account in the same environment.
- The project email or username has ever been used for another purpose.
- A platform demands a personal phone number, personal payment method, identity
  document, or recovery through an existing personal account.
- You cannot preserve recovery codes outside a cloud account tied to you.

If a platform requests personal verification, stop. Do not provide false
identity documents or attempt to defeat the platform's controls. Reassess the
host or use an established public-interest publisher.

## Minimum one-person setup

1. Use a separate operating environment dedicated to APV. A clean, amnesic live
   system on removable media is preferable to a personal browser profile.
2. Route project account creation and every later project login through Tor
   Browser. Never make a single convenience login from an ordinary connection.
3. Create one new project mailbox in that environment. Use it only for APV.
4. Generate unique high-entropy passwords locally. Never reuse them.
5. Use TOTP rather than SMS. Store the TOTP seed and recovery codes in an
   encrypted offline vault with a separate offline backup.
6. Create the Git host account with only the project name and project mailbox.
   Leave profile location, personal name, company, avatar, and biography empty.
7. Use a generic commit identity, for example:

   ```text
   author name: APV Maintainer
   author email: the Git host's project-specific no-reply address
   ```

8. Use HTTPS credentials created only for the project account. Do not reuse a
   personal SSH key, signing key, Git configuration, or credential store.
9. Build releases locally in the dedicated environment. Generated files must
   have deterministic timestamps and must not contain local paths, usernames,
   document-author fields, EXIF data, editor metadata, or machine names.
10. Keep a short private access log so an accidental non-separated login can be
    detected and the threat model reassessed.

## Publishing rules

- Never publish drafts, chat exports, screenshots, office documents authored on
  a personal system, or raw submissions.
- Preserve downloaded official documents exactly; record their hashes. Do not
  claim that removing metadata from a copy preserves the original.
- Analysis is committed as plain UTF-8 text produced through the project build.
- Do not announce releases from personal social accounts.
- Do not use analytics, contact forms, advertising, donation services, or a
  custom domain in the initial release.
- Avoid a predictable publication schedule that mirrors personal routines.

## Residual risks

This procedure does not eliminate identification through a compromised device,
writing-style analysis, timing correlation, account-provider records, hostile
documents, collaborators, or compelled disclosure. If identification could
create an immediate risk of violence or detention, obtain help from a qualified
digital-security organization before publication.

