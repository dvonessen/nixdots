{lib, ...}: {
  dconf.settings = {
    "system/locale" = {
      region = "de_DE.UTF-8";
    };
    "org/gnome/desktop/interface" = {
      # Use middle button from mouse to paste
      gtk-enable-primary-paste = true;
      clock-show-weekday = true;
      clock-show-date = true;
      clock-show-seconds = true;
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      action-double-click-titlebar = "toggle-maximize";
      action-middle-click-titlebar = "minimize";
      action-right-click-titlebar = "menu";
      # Enable minimize, maximize and close in titlebar
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [
        "&DESKTOP"
        "&DOCUMENTS"
        "&MUSIC"
        "&PICTURES"
        "&VIDEOS"
        "&DOWNLOAD"
      ];
    };
    "org/gnome/mutter" = {
      edge-tiling = false; # Disable, using wintile extension
      workspaces-only-on-primary = true;
      experimental-features = ["scale-monitor-framebuffer"];
    };
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 900;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-ac-timeout = 1800;
      power-button-action = "suspend";
    };
    "org/gnome/desktop/screensaver" = {
      # Immediately locking when screen turns off
      # See org/gnome/desktop/session/idle-delay
      lock-delay = lib.hm.gvariant.mkUint32 0;
    };
    "org/gnome/desktop/notifications" = {
      # Show notifications on lock-screen
      show-in-lock-screen = true;
    };
    "org/gnome/system/location" = {
      enabled = false;
    };
    "org/gnome/desktop/privacy" = {
      # Enable recent files
      remember-recent-files = true;
      # Keep recent files forever (-1)
      recent-files-max-age = -1;
      # Delete files in trash after 30 days
      old-files-age = lib.hm.gvariant.mkUint32 30;
      remove-old-trash-files = true;
      remove-old-temp-files = true;
    };
  };
}
