#!/usr/bin/env bash
# Phase 2 (Traduz): copy product spec + TDD from project_specific/traduz/

set -euo pipefail

REPO_ROOT="${1:-.}"
REPO_ROOT="$(cd "$REPO_ROOT" && pwd)"
KIT="$(cd "$(dirname "$0")/../../.." && pwd)"
PRODUCT="$KIT/project_specific/traduz"

if [[ ! -f "$PRODUCT/specs/traduz-v1.md" ]]; then
  echo "seed-traduz-product: missing $PRODUCT/specs/traduz-v1.md" >&2
  exit 1
fi

echo "== seed-traduz-product: repo=$REPO_ROOT =="

mkdir -p "$REPO_ROOT/docs/specs"
cp "$PRODUCT/specs/traduz-v1.md" "$REPO_ROOT/docs/specs/"
cp "$PRODUCT/TRADUZ-TDD.md" "$REPO_ROOT/docs/"

if [[ -f "$REPO_ROOT/backend/.env" ]] && [[ -f "$PRODUCT/templates/backend.env.traduz" ]]; then
  if ! grep -q 'LLM_API_KEY' "$REPO_ROOT/backend/.env" 2>/dev/null; then
    echo "" >> "$REPO_ROOT/backend/.env"
    cat "$PRODUCT/templates/backend.env.traduz" >> "$REPO_ROOT/backend/.env"
    echo "seed-traduz-product: appended LLM_* vars to backend/.env"
  fi
fi

echo "seed-traduz-product: wrote docs/specs/traduz-v1.md and docs/TRADUZ-TDD.md"
