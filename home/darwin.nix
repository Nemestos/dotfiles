{ inputs, ... }:
{
  imports = [
    ./default.nix
    ../modules/cura.nix
    ../modules/syncthing.nix
  ];

  home = {
    stateVersion = "26.05";
    username = "nemestos";
    homeDirectory = "/Users/nemestos";
  };
}
