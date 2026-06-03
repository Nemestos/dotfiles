{ pkgs, ... }:
{
  imports = [ ../../modules/common.nix ];

  nix = {
    enable = false;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  system = {
    stateVersion = 6;
    configurationRevision = null;
    primaryUser = "nemestos";
    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
        minimize-to-application = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        ApplePressAndHoldEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
      };
      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
      screencapture.location = "~/Desktop";
      screensaver.askForPasswordDelay = 10;
    };
  };

  users.users.nemestos = {
    home = "/Users/nemestos";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  fonts.packages = with pkgs; [ nerd-fonts.hack ];

  homebrew = {
    enable = true;
    casks = [
      "shottr"
      "raycast"
    ];
    onActivation.autoUpdate = true;
  };
}
