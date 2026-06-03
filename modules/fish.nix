{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting ""
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
