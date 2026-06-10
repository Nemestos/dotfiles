{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -gx SHELL /run/current-system/sw/bin/fish
    '';

    interactiveShellInit = ''
      set -g fish_greeting ""
      devenv hook fish | source
    '';

    shellAliases = {
      ls = "eza";
      ll = "eza -lh --git";
      la = "eza -lha --git";
      cat = "bat";
      g = "git";
    };
    shellAbbrs = {
      nrs = "sudo darwin-rebuild switch --flake ~/.config/nix#$hostname";
      nfu = "nix flake update";
      nsh = "nix develop";
    };

    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];
  };

}
