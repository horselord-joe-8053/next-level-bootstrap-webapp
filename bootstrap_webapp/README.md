<h1 id="bootstrap-kit-title" style="color:#0d47a1;font-size:1.5em;font-weight:700;border-bottom:2px solid #90caf9;padding-bottom:0.25em;margin-top:0">Web app bootstrap kit</h1>

Portable **factory + product** bootstrap for agent-built single-page apps (React + FastAPI).

## Document outline

1. [How to use](#how)
2. [What the kit contains](#contains)
3. [What the agent still builds](#agent-builds)
4. [Agent vs human](#agent-human)

---

<h2 id="how" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">1. How to use</h2>

| Phase | Action |
|-------|--------|
| **1 — Factory** | Tell the agent: *Read and execute `bootstrap_webapp/bootstrap_webapp_factory.md`* (workspace = new app repo; kit path must be on disk) |
| **2 — Product** | *Read and execute `bootstrap_webapp/bootstrap_webapp_traduz_features.md`* after phase 1 verify green (or both in one session if you say so) |

**Minimal human prompt (Traduz Mat end-to-end):**

1. Read and process `bootstrap_webapp/bootstrap_webapp_factory.md`
2. Read and process `bootstrap_webapp/bootstrap_webapp_traduz_features.md`
3. Optional: `LLM_API_KEY` for manual live translation; pick UI **A/B/C** after phase 2 mock. **Pre-approved:** global `npm install -g ui-ux-pro-max-cli` only (see factory §2). Or run that once yourself before bootstrap.

Kit path: `bootstrap_webapp/` (monorepo) — agent runs **`scripts/`** from here.

---

<h2 id="contains" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">2. What the kit contains</h2>

| Path | Purpose |
|------|---------|
| **`harness/AGENTS.md`** | Agent lifecycle template (`{{APP_NAME}}` placeholders) |
| **`harness/GLOSSARY.md`** | Placeholder glossary |
| **`harness/docs/WEBAPP-TDD.md`** | TDD policy + seams (phase 1 minimal) |
| **`harness/docs/PRODUCT.md`**, **ARCHITECTURE**, **SECURITY** | Stubs |
| **`harness/docs/specs/ui-factory-convention.md`** | UI factory + UI-CHOOSE (mandated in **phase 1** `bootstrap_webapp_factory.md` §4) |
| **`harness/docs/templates/*.md`** | feature-spec, ui-choose-*, plan, bug, ADR |
| **`harness/docs/mocks/README.md`** | Portable mock contract |
| **`harness/dot-agents-skills/*/`** | specify-feature, implement-feature, debug, ui-choose-look |
| **`harness/docs/specs/traduz-v1.md`**, **`harness/docs/TRADUZ-TDD.md`** | Phase 2 product spec + seams (no other repo) |
| **`scripts/seed-harness.sh`** | Copies harness → target repo |
| **`scripts/seed-traduz-product.sh`** | Copies Traduz spec + TRADUZ-TDD into target repo |
| **`scripts/install-agent-skills.sh`** | Matt + ui-ux-pro-max |
| **`scripts/seed-dev-env.sh`** | backend/.env + frontend/.env templates |

**Not in kit (agent writes):** FastAPI/React source, `verify.sh`, `dev.sh`, CI yaml, tests for homepage.

---

<h2 id="agent-builds" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">3. What the agent still builds</h2>

Without reading any existing app repo, the agent must **implement** backend/frontend/scripts from the factory prompt. The kit supplies **policy + templates + harness skills**, not runnable app code.

---

<h2 id="agent-human" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">4. Agent vs human</h2>

| Task | Who |
|------|-----|
| `seed-harness.sh`, scaffold code, verify/dev scripts | **Agent** |
| `install-agent-skills.sh` | **Agent** (approve global npm if needed) |
| `seed-dev-env.sh` | **Agent** |
| Fill **`LLM_API_KEY`** | **Human** |
| `git commit` / push | **Human** unless asked |
