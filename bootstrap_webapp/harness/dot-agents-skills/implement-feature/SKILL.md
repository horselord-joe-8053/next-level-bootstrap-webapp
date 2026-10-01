# implement-feature

Implement an approved spec with strict TDD per `docs/WEBAPP-TDD.md` and UI factory rules in `docs/specs/ui-factory-convention.md`.

1. Read the spec and list vertical slices.
2. If substantial UI work on `frontend/src/**` is required, confirm `docs/specs/<feature>-ui-decision.md` exists (UI-CHOOSE per `ui-choose-look`) unless spec/ticket waives UI-CHOOSE with reason.
3. Propose test seams; wait for human confirmation.
4. For each slice: failing test → minimal code → run test → `./scripts/verify.sh` when appropriate.
5. Mock external HTTP/LLM at the backend test boundary when the spec includes those features.
6. If touching `frontend/src/**`, apply chosen look from `-ui-decision.md`, ui-ux-pro-max checklist, or `design-system/*/MASTER.md`; do not change behavior unless the spec says so.
7. Run `./scripts/verify.sh` before COMPLETE; use evaluator or `/code-review` when valuable.
