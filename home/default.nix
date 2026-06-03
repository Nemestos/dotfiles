{ pkgs, ... }:
{
  imports = [
    ../modules/fish.nix
    ../modules/git.nix
    ../modules/kitty.nix
    ../modules/starship.nix
    ../modules/fzf.nix
  ];

  home = {
    stateVersion = "26.05";
    username = "nemestos";
    homeDirectory = "/Users/nemestos";
    packages = with pkgs; [
      gh
      htop
      tree
    ];
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "bat";
    };
  };

  programs.home-manager.enable = true;
}
