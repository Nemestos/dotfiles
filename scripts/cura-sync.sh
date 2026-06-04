#!/usr/bin/env bash
set -euo pipefail

CURA_VERSION="5.13"
CURA_SRC="$HOME/Library/Application Support/cura/$CURA_VERSION"
CURA_DST="$HOME/.config/nix/config/cura"

echo "🔄 Syncing Cura profiles → Nix config..."

sync_dir() {
  local src="$1"
  local dst="$2"
  local label="$3"

  mkdir -p "$dst"
  rsync -av --delete "$src/" "$dst/"
  echo "✅ $label synced"
}

sync_dir "$CURA_SRC/machine_instances" "$CURA_DST/machine_instances" "machine_instances"
sync_dir "$CURA_SRC/quality_changes"   "$CURA_DST/quality_changes"   "quality_changes"
sync_dir "$CURA_SRC/extruders"         "$CURA_DST/extruders"         "extruders"

echo ""
echo "📁 Current state:"
echo "  machine_instances : $(ls "$CURA_DST/machine_instances" | wc -l | tr -d ' ') files"
echo "  quality_changes   : $(ls "$CURA_DST/quality_changes"   | wc -l | tr -d ' ') files"
echo "  extruders         : $(ls "$CURA_DST/extruders"         | wc -l | tr -d ' ') files"

echo ""
echo "💡 Don't forget to commit:"
echo "   cd ~/.config/nix && git add -A && git commit -m 'chore: sync cura profiles'"