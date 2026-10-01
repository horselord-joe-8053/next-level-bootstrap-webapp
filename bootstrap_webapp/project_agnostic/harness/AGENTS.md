# {{APP_NAME}} Agent Guide

{{APP_DESCRIPTION}}

Domain vocabulary: `GLOSSARY.md`.

## Sources of truth

- Product: `docs/PRODUCT.md`
- Architecture: `docs/ARCHITECTURE.md`
- Security/privacy: `docs/SECURITY.md`
- TDD policy: `docs/WEBAPP-TDD.md`
- UI factory: `docs/specs/ui-factory-convention.md`
- Artifact templates: `docs/templates/`
- Approved feature specs: `docs/specs/`
- Durable plans: `docs/plans/`

## Feature-development lifecycle

For a non-trivial feature or behavior change:

**SPEC → PLAN → UI-CHOOSE (substantial UI) → IMPLEMENT → VERIFY → EVALUATE → COMPLETE**

- **SPEC:** `specify-feature` skill (or Matt `/grill-with-docs` + `/to-spec`). User-visible features include **UI & layout** and **a11y** per `docs/templates/feature-spec.md`.
- **PLAN:** `docs/plans/` only when complexity warrants it.
- **TICKETS (Matt):** `/to-tickets` — optional **UI-CHOOSE** blocked by spec; UI implement blocked by `-ui-decision.md` (see ui-factory-convention).
- **UI-CHOOSE:** **`ui-choose-look`** — 1–3 ui-ux-pro-max directions, one mock (Cursor **canvas** or `docs/mocks/*-ui-options.html`), user pick, `docs/specs/<feature>-ui-decision.md`. No `frontend/src/**` edits until done (waivable for trivial tweaks).
- **IMPLEMENT:** **`implement-feature`** + TDD per `docs/WEBAPP-TDD.md`; ui-ux-pro-max or `design-system/*/MASTER.md` when touching `frontend/src/**`; no behavior drift unless spec says so.
- **VERIFY:** `./scripts/verify.sh` (required).
- **EVALUATE:** `/code-review` or evaluator when valuable.
- **COMPLETE:** after VERIFY + EVALUATE pass.

**Test seams:** follow `docs/WEBAPP-TDD.md` and approved specs **as written** — no human confirmation step unless the spec is missing or contradictory.

## Core invariants

- Browser never receives LLM provider API keys.
- Frontend calls only this app's backend API (not LLM providers directly).
- Server-side persistence of user data requires an approved spec.

## Local development

- `./scripts/dev.sh` — interactive UI (humans); not required for VERIFY.

## Skills

Under `.agents/skills/`:

- **Harness:** `specify-feature`, `implement-feature`, `debug`, `ui-choose-look` (seeded from bootstrap kit)
- **Matt:** `tdd`, `grill-with-docs`, `to-spec`, `to-tickets`, `implement`, `implement-spec`, `code-review`, `setup-matt-pocock-skills` (`npx skills add mattpocock/skills`)
- **UI:** `ui-ux-pro-max` (`uipro init --ai universal`)

Run **`/setup-matt-pocock-skills`** once before GitHub issue integration.
