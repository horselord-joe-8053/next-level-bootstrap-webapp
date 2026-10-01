<h1 id="bootstrap-traduz-title" style="color:#0d47a1;font-size:1.5em;font-weight:700;border-bottom:2px solid #90caf9;padding-bottom:0.25em;margin-top:0">Bootstrap prompt: Traduz product features (phase 2)</h1>

**Kit path:** `bootstrap_webapp/project_specific/traduz/`. Run **after** phase 1 `./scripts/verify.sh` is green.

<h3 id="agent-instructions" style="color:#00695c;font-size:1.05em;font-weight:600;margin-top:0.85em">For the coding agent</h3>

1. **Read this file** from the kit. **Workspace** = app repo root. **`KIT`** = `bootstrap_webapp/`. **`AGNOSTIC`** = `$KIT/project_agnostic/`. Do **not** open any other app repo for specs or code.
2. **Execute** sections 2–6; run scripts yourself; human sets **`LLM_API_KEY`** only when needed for manual live LLM checks.

## Document outline

1. [Mission](#mission)
2. [Spec and glossary](#spec)
3. [Tickets](#tickets)
4. [Implementation](#implement)
5. [UI polish](#ui)
6. [Done](#done)

---

<h2 id="mission" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">1. Mission</h2>

Build **Traduz Mat**: PT-BR → English, localStorage history, copy, styled single page, server-side LLM. **`docs/specs/traduz-v1.md`** ACs + **`./scripts/verify.sh` green**.

If `backend/.env` missing, run **`bash "$AGNOSTIC/scripts/seed-dev-env.sh" <repo-root>`**. Remind human to set **`LLM_API_KEY`** for manual LLM tests.

---

<h2 id="spec" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">2. Spec and glossary</h2>

**Copy product docs from kit (do not invent ACs from memory):**

```bash
bash "$KIT/project_specific/traduz/scripts/seed-traduz-product.sh" "$REPO_ROOT"
```

Then update **`GLOSSARY.md`**, **`docs/PRODUCT.md`**, and **`AGENTS.md`** for Traduz Mat (terms, invariants, links to `docs/TRADUZ-TDD.md` and `docs/specs/traduz-v1.md`). Optional UI sections in the spec may reference `docs/templates/feature-spec.md` layout only.

**Test seams:** use the table in `docs/specs/traduz-v1.md` and `docs/TRADUZ-TDD.md` **as-is** — do not ask the human to confirm.

---

<h2 id="tickets" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">3. Tickets</h2>

**`/to-tickets`:** (1) baseline translate (2) history → blocked by 1 (3) copy → blocked by 1 (4) **UI-CHOOSE** (`traduz-v1`) → blocked by 1–3 (5) **UI implement** → blocked by 4 (`docs/specs/traduz-v1-ui-decision.md`). Functional slices: behavior-first styling OK; **no final layout polish** until ticket 5. Implement via **`/implement-spec`** or **`/tdd`** per ticket.

---

<h2 id="implement" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">4. Implementation</h2>

TDD at seams; mock LLM; `./scripts/verify.sh` each slice; optional **`/code-review`**.

---

<h2 id="ui" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">5. UI polish (factory UI-CHOOSE — ticket 4–5)</h2>

Phase 1 only installed the UI factory **machinery**; **this phase** is the first time mocks make sense — **`traduz-v1.md`** defines the real screen (translate, history, copy). Follow **factory §4** (`project_agnostic/bootstrap_webapp_factory.md`) and **`.agents/skills/ui-choose-look/SKILL.md`** end-to-end:

1. Run **ui-ux-pro-max** `scripts/search.py` (**separate** `--design-system` queries per direction) — record STYLE/COLORS/TYPOGRAPHY in **`docs/specs/traduz-v1-ui-options.md`** (skills alone do not apply polish).
2. **One mock** at **production density** (translate panel + history column, sample strings, buttons, empty states): Cursor **`.canvas.tsx`** (preferred) or **`docs/mocks/traduz-v1-ui-options.html`** — not wireframe-only gray boxes.
3. **AskQuestion** — pick **A / B / C** or mix
4. **`docs/specs/traduz-v1-ui-decision.md`** + update spec UI section
5. Implement layout + tokens in **`App.tsx`** + **`styles.css`** (font, spacing, panels, a11y); optional **`design-system/*/MASTER.md --persist`**; **`./scripts/verify.sh`**

Waive multi-mock **only** if the human explicitly says so in chat (record in `-ui-decision.md`). Do not skip the mock step by default.

---

<h2 id="done" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">6. Done</h2>

All ACs met; verify green; README updated. Display name **Traduz Mat** or **Traduz Mat Enhanced** if folder says so.

- [ ] **`traduz-v1-ui-options.md`**, mock artifact linked, **`traduz-v1-ui-decision.md`**, human choice recorded
- [ ] UI implement ticket complete per factory UI-CHOOSE
