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

        "editor.defaultFormatter" = "biomejs.biome";
        "editor.codeActionsOnSave" = {
          "source.organizeImports.biome" = "explicit";
          "source.fixAll.biome" = "explicit";
        };

        "[typescript]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[javascriptreact]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[json]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[jsonc]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };

        "terminal.integrated.fontFamily" = "'Hack Nerd Font'";
        "terminal.integrated.fontSize" = 13;
        "terminal.integrated.env.osx" = {
          "TERM" = "xterm-256color";
          "SHELL" = "/run/current-system/sw/bin/fish";
        };
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

        "json.schemaDownload.trustedDomains" = {
          "https://biomejs.dev" = true;
          "https://developer.microsoft.com/json-schemas/" = true;
          "https://json-schema.org/" = true;
          "https://json.schemastore.org/" = true;
          "https://raw.githubusercontent.com/devcontainers/spec/" = true;
          "https://raw.githubusercontent.com/microsoft/vscode/" = true;
          "https://schemastore.azurewebsites.net/" = true;
          "https://www.schemastore.org/" = true;
          "https://turbo.build/" = true;
          "https://unpkg.com" = true;
        };
        "github.copilot.chat.commitMessageGeneration.instructions" = [
          {
            "text" =
              "Always generate a SINGLE commit message for all staged changes. Use Conventional Commits format: <type>(<scope>): <description>. Types: feat, fix, chore, docs, style, refactor, test, perf. Use imperative mood ('add', 'fix', not 'added', 'fixed'). Keep the subject line under 72 characters, lowercase, no trailing period. Only add a body if the subject line cannot fully describe the changes, separated by a blank line. Always write in English.";
          }
        ];
      };

      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        eamodio.gitlens
        biomejs.biome
        usernamehw.errorlens
        christian-kohler.path-intellisense
        datakurre.devenv
      ];
    };
  };
}
