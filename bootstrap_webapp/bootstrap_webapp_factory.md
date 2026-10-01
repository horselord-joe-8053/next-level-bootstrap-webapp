<h1 id="bootstrap-factory-title" style="color:#0d47a1;font-size:1.5em;font-weight:700;border-bottom:2px solid #90caf9;padding-bottom:0.25em;margin-top:0">Bootstrap prompt: generic web app factory (phase 1)</h1>

**Kit path:** `bootstrap_webapp/` (this file + `harness/` + `scripts/` + `templates/`).

<h3 id="agent-instructions" style="color:#00695c;font-size:1.05em;font-weight:600;margin-top:0.85em">For the coding agent</h3>

1. **Read this file** from the kit (do not require the human to paste body text).
2. **Workspace:** target **new app repo root** (empty or git-init only). Resolve **`KIT`** = directory containing this file (`bootstrap_webapp/`). Do **not** read or copy from any other application repo.
3. **Execute** sections 2–6 in order; run shell commands yourself. **Human pre-approval (default):** run `npm install -g ui-ux-pro-max-cli` when `install-agent-skills.sh` needs it — **do not stop to ask** unless the human opted out in chat.
4. **Stop** when §6 checklist is green. Phase 2 is a **separate** prompt: `bootstrap_webapp_traduz_features.md` (or run it in the same session if the human asked for full Traduz Mat in one go).

## Document outline

1. [Mission](#mission)
2. [Agent-run setup](#agent-setup)
3. [Scaffold](#scaffold)
4. [UI factory built-in](#ui-factory)
5. [Homepage](#homepage)
6. [Done](#done)

---

<h2 id="mission" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">1. Mission</h2>

New git-ready repo: FastAPI `GET /health`, React single-page **homepage placeholder**, full **UI factory** harness (UI-CHOOSE **machinery** — convention, skills, templates; **not** product Canvas mocks yet), **`./scripts/verify.sh` green**. No product features (phase 2: `bootstrap_webapp_traduz_features.md` — then Canvas mock + user pick for that product).

---

<h2 id="agent-setup" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">2. Agent-run setup</h2>

The **coding agent** runs these; **human** fills `LLM_API_KEY` later (phase 2 manual LLM only).

| Step | Command |
|------|---------|
| Skills | `bash <path-to-kit>/scripts/install-agent-skills.sh <repo-root>` — if `uipro` is missing, run **`npm install -g ui-ux-pro-max-cli`** (human **pre-approved** by using this bootstrap; then `uipro init --ai universal` + `npx skills add mattpocock/skills`). **Do not** install other global npm packages. |
| Env files | `bash <path-to-kit>/scripts/seed-dev-env.sh <repo-root>` — creates `backend/.env` with empty `LLM_API_KEY`, `LLM_BASE_URL=https://api.openai.com/v1`, `LLM_MODEL=gpt-4o-mini`; creates `frontend/.env`. |
| Reminder | README: *“Set `LLM_API_KEY` in `backend/.env` for live translation (phase 2).”* |

Requires **Python 3** on the machine for ui-ux-pro-max search scripts.

---

<h2 id="scaffold" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">3. Scaffold</h2>

**First — copy factory harness (do not invent from memory):**

```bash
bash <kit>/scripts/seed-harness.sh <repo-root> "<App Name>" "<One-line description>"
```

This writes **`AGENTS.md`**, **`GLOSSARY.md`**, **`docs/WEBAPP-TDD.md`**, **`docs/templates/*`**, **`docs/mocks/README.md`**, **`docs/specs/ui-factory-convention.md`**, and harness **`.agents/skills/`** (`specify-feature`, `implement-feature`, `debug`, `ui-choose-look`) from **`bootstrap_webapp/harness/`**.

**Then — agent-generated code (no other repo):**

- `backend/`, `frontend/`, `scripts/verify.sh`, `scripts/dev.sh`, `.github/workflows/ci.yml`, `.gitignore`, `README.md`
- Homepage skeleton (§4). Ports: API **8900**, UI **5973**.

**Then — skills and env:**

```bash
bash <kit>/scripts/install-agent-skills.sh <repo-root>
bash <kit>/scripts/seed-dev-env.sh <repo-root>
```

---

<h2 id="ui-factory" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">4. UI factory (built-in — not product-specific)</h2>

**UI-CHOOSE is part of the generic factory**, seeded in §3. Phase 1 installs **rules and tooling only**. **Canvas / HTML mocks and user choice belong in phase 2+** — until an approved **product spec** exists, the factory does not know **what screen or flows** to mock.

| Phase | UI-CHOOSE scope |
|-------|-----------------|
| **1 (this file)** | Seed convention, `ui-choose-look`, templates, ui-ux-pro-max; agent reads procedure once. **No product mock artifact.** |
| **2+ (product bootstrap or feature spec)** | Run **full steps 1–7** against that spec (e.g. Traduz: translate + history + copy layout in one Canvas or HTML file). |

| Source | Purpose |
|--------|---------|
| `docs/specs/ui-factory-convention.md` | Lifecycle: SPEC → **UI-CHOOSE** → IMPLEMENT → VERIFY |
| `.agents/skills/ui-choose-look/SKILL.md` | Procedure when a spec exists: ui-ux-pro-max → `-ui-options.md` → **one mock** (Cursor **`.canvas.tsx`** / `docs/mocks/*-ui-options.html`) → **human picks A/B/C** → `-ui-decision.md` → `frontend/src/**` |
| `docs/templates/ui-choose-options.md`, `ui-choose-decision.md` | Artifact shape |
| `AGENTS.md` | Same lifecycle; `implement-feature` blocks substantial product UI without `-ui-decision.md` |

**Agent:** After `seed-harness.sh`, **read** `ui-factory-convention.md` and `ui-choose-look` once. **Do not** run Canvas multi-option UI-CHOOSE in phase 1.

**Phase 1 homepage (§5):** Placeholder only — **waive multi-option mocks** (no product spec yet). Write **`docs/specs/homepage-ui-decision.md`**: *“Phase 1 factory shell; UI-CHOOSE mocks deferred until product spec (phase 2).”*

**Product phase (e.g. Traduz):** **`bootstrap_webapp_traduz_features.md`** supplies the spec; then run **full `ui-choose-look`** unless the **human** explicitly waives in chat (record in `-ui-decision.md`).

---

<h2 id="homepage" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">5. Homepage</h2>

Backend: health + pytest. Frontend: `App.tsx` title + placeholder; Vitest smoke test; optional `styles.css` import. Apply §4 waiver + **`homepage-ui-decision.md`** before editing `frontend/src/**`.

---

<h2 id="done" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">6. Done</h2>

- [ ] `./scripts/verify.sh` passes
- [ ] `.agents/skills/ui-ux-pro-max`, Matt skills, **`ui-choose-look`** present
- [ ] **`docs/specs/ui-factory-convention.md`** and **`docs/specs/homepage-ui-decision.md`** exist
- [ ] `backend/.env` exists with **empty** `LLM_API_KEY` + reminder in README
- [ ] Ready for **`bootstrap_webapp_traduz_features.md`** (product spec there → **Canvas mock + pick** per §4)
