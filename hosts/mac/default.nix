{ pkgs, ... }:
{
  imports = [
    ../../modules/common.nix
    ./system.nix
    ./homebrew.nix
  ];
  system.activationScripts.postActivation.text = ''
    chsh -s /run/current-system/sw/bin/fish nemestos
  '';

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
