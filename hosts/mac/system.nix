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
        expose-group-apps = true;
        mru-spaces = false;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.5;
      };

      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        AppleShowAllFiles = true;
        FXPreferredViewStyle = "clmv";
        NewWindowTarget = "Home";
        _FXShowPosixPathInTitle = true;
        FXDefaultSearchScope = "SCcf";
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
        NSDocumentSaveNewDocumentsToCloud = false;
        AppleShowScrollBars = "Always";
        NSWindowResizeTime = 0.001;
      };

      trackpad = {
        Clicking = false;
        TrackpadThreeFingerDrag = true;
      };

      screencapture.location = "~/Desktop";
      screensaver.askForPasswordDelay = 10;

      CustomSystemPreferences = {
        "com.apple.Accessibility" = {
          ReduceMotionEnabled = 1;
        };
        "com.apple.spaces" = {
          "spans-displays" = false;
        };
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
      };
    };
  };
}
