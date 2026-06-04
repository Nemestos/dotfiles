{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;

    package = lib.mkIf pkgs.stdenv.isLinux pkgs.vscode.fhs;

    profiles.default = {
      userSettings = {
        "editor.fontSize" = 14;
        "editor.formatOnSave" = true;
        "editor.tabSize" = 2;
        "editor.fontFamily" = "'Hack Nerd Font', monospace";
        "editor.cursorBlinking" = "smooth";
        "editor.minimap.enabled" = false;
        "terminal.integrated.fontFamily" = "'Hack Nerd Font'";
        "terminal.integrated.env.osx" = {
          "TERM" = "xterm-256color";
        };

        "terminal.integrated.fontSize" = 13;
        "terminal.integrated.defaultProfile.osx" = lib.mkIf pkgs.stdenv.isDarwin "fish";
        "terminal.integrated.defaultProfile.linux" = lib.mkIf pkgs.stdenv.isLinux "fish";

        "workbench.colorTheme" = "Catppuccin Macchiato";
        "workbench.iconTheme" = "catppuccin-macchiato";
        "workbench.startupEditor" = "none";
        "workbench.sideBar.location" = "right";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings".nixd.formatting.command = [ "nixfmt" ];

        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "git.autofetch" = true;
        "telemetry.telemetryLevel" = "off";
        "security.workspace.trust.enabled" = false;

        "json.schemaDownload.enable" = true;
      };

      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        eamodio.gitlens
        esbenp.prettier-vscode
        usernamehw.errorlens
        mkhl.direnv
        christian-kohler.path-intellisense
      ];
    };
  };
}
