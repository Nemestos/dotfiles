{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    ripgrep
    fd
    bat
    eza
    fzf
    jq
    nixfmt
    nixd
    statix
    deadnix
    sops
    age
    neovim
  ];
}
