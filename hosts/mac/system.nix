{ ... }:
{
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
        AppleShowAllFiles = true;
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
}