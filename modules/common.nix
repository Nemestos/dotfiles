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
    nixfmt-rfc-style # formateur officiel
    statix # linter
    deadnix # détecte les variables inutilisées
  ];
}
