{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
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
      sops
      age
    ];
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "bat";
      SOPS_AGE_KEY_FILE = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    };
    file.".ssh/id_ed25519.pub".text =
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHBrVNQbA78EIfWUKgJ85oHF5+KsBhHvm7QYXNKK+D5b pro@leoturpin.fr";
  };

  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    secrets.ssh_private_key = {
      sopsFile = ../secrets/ssh.yaml;
      path = "${config.home.homeDirectory}/.ssh/id_ed25519";
      mode = "0600";
    };
    secrets.vivaldi_sync_key = {
      sopsFile = ../secrets/vivaldi.yaml;
      path = "${config.home.homeDirectory}/.config/vivaldi-sync-key.txt";
      mode = "0600";
    };
  };

  programs.man.enable = false;
  programs.home-manager.enable = true;
}
