#!/usr/bin/env bash
# Vendorizza references/*.md (fonte canonica) dentro ogni skills/<nome>/references/.
# Ogni skill deve restare self-contained per essere installabile singolarmente
# tramite `npx skills add` su qualsiasi harness (non solo Claude Code plugin,
# dove ${CLAUDE_PLUGIN_ROOT} risolverebbe la cartella condivisa).
#
# Eseguire dopo ogni modifica a references/*.md, prima di pubblicare/pushare.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REFS_SRC="$ROOT_DIR/references"

for skill_dir in "$ROOT_DIR"/skills/*/; do
  skill_name="$(basename "$skill_dir")"
  dest="$skill_dir/references"
  mkdir -p "$dest"
  rm -f "$dest"/*.md
  cp "$REFS_SRC"/*.md "$dest/"
  echo "synced -> $skill_name/references/"
done
