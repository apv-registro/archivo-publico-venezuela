# Publication and correction rules

These rules are enforced by the project structure so the maintainer does not
have to make them up separately for every case.

## What may be included

- An official public act with a retrievable or preserved primary document.
- A person whose participation is stated in that document or another primary
  official record.
- An attributed assessment from an identifiable publisher.
- Project analysis that states its method and cites every necessary premise.

## What may not be included

- Anonymous accusations presented as facts.
- Guilt by employment, party membership, family relationship, or association.
- Private contact information, home addresses, or identifiers unnecessary for
  distinguishing public officials.
- A claim that inclusion means a person is sanctioned, convicted, or corrupt.
- A person's inferred vote or participation when the record does not show it.

## Wording

Use verbs proved by the record: signed, issued, voted, served, appointed,
received, ordered, or implemented. Keep legal or statistical conclusions in a
separate `project_analysis` claim. Name the author of every external assessment.

## Corrections

Every published record has a status. Corrections append a dated explanation and
preserve the previous version in Git history. A credible identity mismatch or
document-integrity dispute changes the status to `disputed` until resolved.

The initial correction channel should be the project email published with an
OpenPGP public key. No contact form is needed.

