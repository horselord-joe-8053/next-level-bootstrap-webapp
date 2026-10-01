<h1 id="bootstrap-factory-title" style="color:#0d47a1;font-size:1.5em;font-weight:700;border-bottom:2px solid #90caf9;padding-bottom:0.25em;margin-top:0">Bootstrap prompt: generic web app factory (phase 1)</h1>

**Kit path:** `bootstrap_webapp/project_agnostic/` (this file + `harness/` + `scripts/` + `templates/`).

<h3 id="agent-instructions" style="color:#00695c;font-size:1.05em;font-weight:600;margin-top:0.85em">For the coding agent</h3>

1. **Read this file** from the kit. **`AGNOSTIC`** = `bootstrap_webapp/project_agnostic/`. **`KIT`** = `bootstrap_webapp/`.
2. **Workspace:** new **app repo root**. Do **not** read or copy from any other application repo.
3. **Execute** sections 2–6; run scripts under **`$AGNOSTIC/scripts/`**. Pre-approved: `npm install -g ui-ux-pro-max-cli` when needed.
4. **Stop** when §6 is green. Phase 2: human picks **`project_specific/<product>/bootstrap_*_features.md`** (not part of phase 1).

## Document outline

1. [Mission](#mission)
2. [Agent-run setup](#agent-setup)
3. [Scaffold](#scaffold)
4. [UI factory built-in](#ui-factory)
5. [Homepage](#homepage)
6. [Done](#done)

---

<h2 id="mission" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">1. Mission</h2>

Git-ready repo: FastAPI `GET /health`, React **homepage placeholder**, **UI factory** harness (UI-CHOOSE machinery only), **`./scripts/verify.sh` green**. **No product features** in phase 1.

---

<h2 id="agent-setup" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">2. Agent-run setup</h2>

| Step | Command |
|------|---------|
| Skills | `bash "$AGNOSTIC/scripts/install-agent-skills.sh" <repo-root>` |
| Env | `bash "$AGNOSTIC/scripts/seed-dev-env.sh" <repo-root>` — generic `backend/.env` + `frontend/.env` templates |

Requires **Python 3** for ui-ux-pro-max search scripts.

---

<h2 id="scaffold" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">3. Scaffold</h2>

```bash
bash "$AGNOSTIC/scripts/seed-harness.sh" <repo-root> "<App Name>" "<One-line description>"
bash "$AGNOSTIC/scripts/seed-scaffold-scripts.sh" <repo-root>
```

Then agent-generated: `backend/`, `frontend/`, CI, `.gitignore`, `README.md`. Default ports **8900** / **5973** (`APP_*_PORT` in `dev.sh`).

Then:

```bash
bash "$AGNOSTIC/scripts/install-agent-skills.sh" <repo-root>
bash "$AGNOSTIC/scripts/seed-dev-env.sh" <repo-root>
```

---

<h2 id="ui-factory" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">4. UI factory (built-in)</h2>

Phase 1: seed **`ui-factory-convention.md`**, **`ui-choose-look`**, templates — **no product mocks**.

**Generality:** Process only; no fixed visual target. Product **UI-CHOOSE** runs in phase 2 from **`project_specific/<product>/`** spec.

**Homepage waiver:** write **`docs/specs/homepage-ui-decision.md`** (mocks deferred until product spec).

---

<h2 id="homepage" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">5. Homepage</h2>

Backend health + pytest; frontend title placeholder + Vitest smoke test.

---

<h2 id="done" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">6. Done</h2>

- [ ] `./scripts/verify.sh` passes
- [ ] ui-ux-pro-max, Matt skills, `ui-choose-look` present
- [ ] `docs/specs/ui-factory-convention.md`, `homepage-ui-decision.md`
- [ ] Ready for **`project_specific/<product>/`** phase 2 prompt (see kit root `README.md`)
