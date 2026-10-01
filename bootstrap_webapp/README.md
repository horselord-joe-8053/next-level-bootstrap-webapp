<h1 id="bootstrap-kit-title" style="color:#0d47a1;font-size:1.5em;font-weight:700;border-bottom:2px solid #90caf9;padding-bottom:0.25em;margin-top:0">Web app bootstrap kit</h1>

## Document outline

1. [Layout](#layout)
2. [How to use](#how)
3. [Adding a new product](#new-product)

---

<h2 id="layout" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">1. Layout</h2>

| Path | Role |
|------|------|
| **`project_agnostic/`** | Phase 1 factory: harness, scripts, templates, `bootstrap_webapp_factory.md` |
| **`project_specific/<product>/`** | Phase 2 product packs (spec, TDD, seed script, bootstrap prompt) |

**Products shipped in kit:**

| Product | Phase 2 prompt |
|---------|----------------|
| **traduz** | `project_specific/traduz/bootstrap_webapp_traduz_features.md` |

---

<h2 id="how" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">2. How to use</h2>

1. Copy **`bootstrap_webapp/`** beside or into the new app repo.
2. Agent: read and execute **`project_agnostic/bootstrap_webapp_factory.md`**
3. After verify green: read and execute **`project_specific/<product>/bootstrap_*.md`**

Scripts always live under **`project_agnostic/scripts/`** (and **`project_specific/<product>/scripts/`** for product seeds).

---

<h2 id="new-product" style="color:#1565c0;font-size:1.22em;font-weight:650;border-left:4px solid #42a5f5;padding-left:10px;margin-top:1.1em">3. Adding a new product</h2>

Add **`project_specific/<slug>/`**: feature spec, product TDD, `bootstrap_<slug>_features.md`, `scripts/seed-<slug>-product.sh`. Do **not** put product specs in `project_agnostic/harness/`.
