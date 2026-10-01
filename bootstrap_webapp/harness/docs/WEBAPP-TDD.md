# Web app — TDD policy

## Loop

1. Map acceptance criteria to **vertical slices** (smallest user-visible behavior).
2. **Use test seams** from this file and the approved feature spec **as written** — do **not** ask the human to confirm. If the spec is silent or contradictory, update the spec (or ask **one** clarifying question only when blocked).
3. **Red:** one failing test at one seam.
4. **Green:** minimal code; run the test, then `./scripts/verify.sh`.
5. Refactor during review/evaluate, not inside red → green.

## Default seams (phase 1 homepage)

| Seam | Tool | Test behavior |
|------|------|----------------|
| HTTP API | pytest + `TestClient` | `GET /health` |
| React UI | Vitest + Testing Library | Homepage renders expected heading |

## Product phase seams

When the product bootstrap adds API features, extend this table (e.g. POST routes, LLM mock boundary, `localStorage`, clipboard module). Optionally rename file to `docs/<PRODUCT>-TDD.md` and update `AGENTS.md` links.

## Avoid

- Horizontal slicing (all tests, then all code).
- Testing private helpers instead of public behavior.
- Live LLM calls in CI.

## UI polish and tickets

See `docs/specs/ui-factory-convention.md`. **`/to-tickets`:** fold UI+a11y into frontend slices, or **UI-CHOOSE** then implement blocked by `-ui-decision.md`.

## Matt `/tdd`

[mattpocock/skills `/tdd`](https://github.com/mattpocock/skills/blob/main/skills/engineering/tdd/SKILL.md) is the procedure; this file is the **project seam reference**.
