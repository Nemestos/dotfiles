{
  pkgs,
  config,
  inputs,
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
    ../modules/vscode.nix
  ];

  home = {
    packages = with pkgs; [
      # outils CLI
      ripgrep
      fd
      bat
      eza
      jq
      neovim

      # nix tooling
      alejandra
      nixd
      nixfmt
      statix
      deadnix

      # secrets
      sops
      age

      # github
      gh
      htop
      tree

      nodejs_latest
      python314
      pnpm
      python3Packages.pip
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
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
