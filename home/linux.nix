{ inputs, ... }:
{
  imports = [
    ./default.nix
  ];

  home = {
    stateVersion = "26.05";
    username = "nemestos";
    homeDirectory = "/home/nemestos";
  };
}