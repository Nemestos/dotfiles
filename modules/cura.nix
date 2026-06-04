{
  lib,
  pkgs,
  config,
  ...
}:
let
  curaVersion = "5.13";
  curaBase = "${config.home.homeDirectory}/Library/Application Support/cura/${curaVersion}";
  curaConfig = toString ../config/cura;
in
{
  home.activation.curaCopy = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "🖨️  Syncing Cura profiles..."
    for dir in machine_instances quality_changes extruders; do
      mkdir -p "${curaBase}/$dir"
      for f in "${curaConfig}/$dir"/*; do
        dest="${curaBase}/$dir/$(basename $f)"
        if [ ! -f "$dest" ] || [ "$f" -nt "$dest" ]; then
          $DRY_RUN_CMD cp "$f" "$dest"
          $DRY_RUN_CMD chmod 600 "$dest"
        fi
      done
    done
    echo "✅ Cura profiles synced"
  '';
}
