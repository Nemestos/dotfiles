{ inputs, ... }:
{
  imports = [
    ./default.nix
    ../modules/cura.nix
  ];

  home = {
    stateVersion = "26.05";
    username = "nemestos";
    homeDirectory = "/Users/nemestos";
  };
}
