{ lib, pkgs, ... }:
let
  curaVersion = "5.13";
  curaBase = "Library/Application Support/cura/${curaVersion}";
  curaConfig = ../config/cura;

  filesIn = dir: builtins.attrNames (builtins.readDir dir);

  linkDir =
    src: dest:
    map (f: {
      name = "${dest}/${f}";
      value.source = "${src}/${f}";
    }) (filesIn src);
in
{
  home.file = lib.mkIf pkgs.stdenv.isDarwin (
    lib.listToAttrs (
      linkDir "${curaConfig}/machine_instances" "${curaBase}/machine_instances"
      ++ linkDir "${curaConfig}/quality_changes" "${curaBase}/quality_changes"
      ++ linkDir "${curaConfig}/extruders" "${curaBase}/extruders"
    )
  );
}
