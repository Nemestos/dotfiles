{ pkgs, ... }:
{
  imports = [
    ../../modules/common.nix
    ./system.nix
    ./homebrew.nix
  ];

  nix = {
    enable = false;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  users.users.nemestos = {
    home = "/Users/nemestos";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  fonts.packages = with pkgs; [ nerd-fonts.hack ];
}