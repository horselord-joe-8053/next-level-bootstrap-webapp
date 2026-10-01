#!/usr/bin/env bash
# Copy bootstrap_webapp/harness/* into a new app repo (factory docs + harness skills).

set -euo pipefail

REPO_ROOT="${1:-.}"
APP_NAME="${2:-Web App}"
APP_DESC="${3:-A single-page web application (React + FastAPI).}"

REPO_ROOT="$(cd "$REPO_ROOT" && pwd)"
KIT="$(cd "$(dirname "$0")/.." && pwd)"
HARNESS="$KIT/harness"

if [[ ! -d "$HARNESS" ]]; then
  echo "seed-harness: missing $HARNESS" >&2
  exit 1
fi

echo "== seed-harness: repo=$REPO_ROOT app=$APP_NAME =="

# Root files
for f in AGENTS.md GLOSSARY.md; do
  sed -e "s/{{APP_NAME}}/$APP_NAME/g" -e "s/{{APP_DESCRIPTION}}/$APP_DESC/g" \
    "$HARNESS/$f" > "$REPO_ROOT/$f"
done

# docs tree
mkdir -p "$REPO_ROOT/docs/specs" "$REPO_ROOT/docs/templates" "$REPO_ROOT/docs/mocks" "$REPO_ROOT/docs/plans"
for f in WEBAPP-TDD.md PRODUCT.md ARCHITECTURE.md SECURITY.md; do
  sed -e "s/{{APP_NAME}}/$APP_NAME/g" \
    "$HARNESS/docs/$f" > "$REPO_ROOT/docs/$f"
done
cp "$HARNESS/docs/specs/ui-factory-convention.md" "$REPO_ROOT/docs/specs/"
cp "$HARNESS/docs/templates/"*.md "$REPO_ROOT/docs/templates/"
cp "$HARNESS/docs/mocks/README.md" "$REPO_ROOT/docs/mocks/"

# Harness skills (merge; do not delete existing Matt / ui-ux-pro-max trees)
mkdir -p "$REPO_ROOT/.agents/skills"
for skill in specify-feature implement-feature debug ui-choose-look; do
  mkdir -p "$REPO_ROOT/.agents/skills/$skill"
  cp "$HARNESS/dot-agents-skills/$skill/SKILL.md" "$REPO_ROOT/.agents/skills/$skill/"
done

echo "seed-harness: copied AGENTS.md, GLOSSARY.md, docs/*, docs/templates/*, docs/mocks/README, 4 harness skills."
echo "seed-harness: next — install-agent-skills.sh, seed-dev-env.sh, then scaffold backend/frontend/scripts."
