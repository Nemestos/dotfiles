{ pkgs, ... }:
{
  imports = [ ../../modules/common.nix ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nemestos-wsl";

  users.users.nemestos = {
    isNormalUser = true;
    home = "/home/nemestos";
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
  };

  programs.fish.enable = true;

  system.stateVersion = "26.05";
}
