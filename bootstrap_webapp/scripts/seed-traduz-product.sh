#!/usr/bin/env bash
# Phase 2: copy Traduz product spec + TDD policy from kit (no other repo).

set -euo pipefail

REPO_ROOT="${1:-.}"
REPO_ROOT="$(cd "$REPO_ROOT" && pwd)"
KIT="$(cd "$(dirname "$0")/.." && pwd)"
HARNESS="$KIT/harness"

if [[ ! -f "$HARNESS/docs/specs/traduz-v1.md" ]]; then
  echo "seed-traduz-product: missing harness spec" >&2
  exit 1
fi

echo "== seed-traduz-product: repo=$REPO_ROOT =="

mkdir -p "$REPO_ROOT/docs/specs"
cp "$HARNESS/docs/specs/traduz-v1.md" "$REPO_ROOT/docs/specs/"
cp "$HARNESS/docs/TRADUZ-TDD.md" "$REPO_ROOT/docs/"

echo "seed-traduz-product: wrote docs/specs/traduz-v1.md and docs/TRADUZ-TDD.md"
echo "seed-traduz-product: update GLOSSARY.md, docs/PRODUCT.md, AGENTS.md links; then implement ACs."
