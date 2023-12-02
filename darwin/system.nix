{username, ...}: {
  # Create user danielvonessen
  users.users = {
    ${username} = {
      name = username;
      home = "/Users/${username}";
    };
  };
  programs.zsh.enable = true;
  programs.bash.enable = true;
  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  system = {
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    # Thanks to https://github.com/ryan4yin/nix-config/blob/main/modules/darwin/system.nix#L15C5-L15C5
    # License: MIT
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
    # END
    defaults = {
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        AppleShowScrollBars = "Automatic";
        AppleWindowTabbingMode = "always";
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSDisableAutomaticTermination = true;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSTableViewDefaultSizeMode = 1;
        NSWindowResizeTime = 0.001;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
        "com.apple.keyboard.fnState" = false;
        "com.apple.swipescrolldirection" = false;
        "com.apple.trackpad.scaling" = 1.5;
      };
      dock = {
        appswitcher-all-displays = true;
        autohide = true;
        autohide-delay = 0.25;
        expose-group-by-app = true;
        launchanim = true;
        magnification = false;
        mineffect = "scale";
        minimize-to-application = true;
        orientation = "bottom";
        show-process-indicators = true;
        show-recents = false;
        tilesize = 39;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
        FXDefaultSearchScope = "SCcf";
      };
      menuExtraClock = {
        Show24Hour = true;
        ShowAMPM = false;
        ShowDate = 0;
        ShowDayOfMonth = true;
        ShowDayOfWeek = true;
        ShowSeconds = true;
      };
      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };
      spaces.spans-displays = true;
      trackpad = {
        ActuationStrength = 1;
        Clicking = true;
        Dragging = true;
        FirstClickThreshold = 0;
        SecondClickThreshold = 0;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = false;
      };
      # TODO: https://github.com/LnL7/nix-darwin/issues/705
      # universalaccess.reduceTransparency = true;

      CustomUserPreferences = {
        "com.apple.finder"._FXSortFoldersFirst = true;
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;
      };

    };
  };
  launchd.agents.ThunderbirdEnv = {
    serviceConfig = {
      ProgramArguments = [
        "/bin/sh"
        "-c"
        "launchctl setenv MOZ_LEGACY_PROFILES 1; launchctl setenv MOZ_ALLOW_DOWNGRADE 1"
      ];
      RunAtLoad = true;
    };
  };
}
