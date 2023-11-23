{lib, config, ...}: {
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.hm.gvariant.mkTuple ["xkb" "de+mac_nodeadkeys"])
      ];
      # Allow rigth <ctrl> to trigger third keyboard level
      xkb-options = ["lv3:switch" "altwin:swap_alt_win"];
    };
    "org/gnome/desktop/peripherals/mouse" = {
      # Make mouse move in accelerated mode
      accel-profile = "adaptive";
      speed = -0.12;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "fingers";
      disable-while-typing = true;
    };

    # Keyboard shortcuts
    "org/gnome/settings-daemon/plugins/media-keys" = {
      home = ["<Alt>d"];
      search = ["<Alt>space"];
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      repeat = true;
      repeat-interval = lib.hm.gvariant.mkUint32 18;
      delay = lib.hm.gvariant.mkUint32 300;
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Alt>q"];
      switch-group = ["<Alt>less"];
      switch-group-backward = ["<Shift><Alt>less"];
      activate-window-menu = ["<Super>space"];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Alt><Super>t";
      command = "wezterm --config-file=${config.home.homeDirectory}/.config/wezterm/wezterm.lua";
      name = "terminal";
    };
      # Touchpad
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      speed = 0.30;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };
  };
}
