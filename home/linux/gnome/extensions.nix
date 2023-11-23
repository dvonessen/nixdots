{pkgs, ...}: {
  home.packages = with pkgs.gnomeExtensions; [
    wintile-windows-10-window-tiling-for-gnome
    appindicator
    blur-my-shell
    bluetooth-quick-connect
  ];

  dconf.settings = {
    # List of enabled gnome-shell extensions
    "org/gnome/shell" = {
      enabled-extensions = [
        "wintile@nowsci.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "bluetooth-quick-connect@bjarosze.gmail.com"
        "blur-my-shell@aunetx"
      ];
    };
    # Configure wintile
    "org/gnome/desktop/wm/keybindings" = {
      maximize = ["<Control><Shift><Super>Up"];
      unmaximize = ["<Control><Shift><Super>Down" "<Alt>F5"];
    };
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = ["<Control><Shift><Super>Left"];
      toggle-tiled-right = ["<Control><Shift><Super>Right"];
    };
    "org/gnome/shell/extensions/wintile" = {
      delay = 300;
      use-minimize = false;
    };
    # Bluetooth quick connect configuration
    "org/gnome/shell/extensions/bluetooth-quick-connect" = {
      keep-menu-on-toggle = true;
      refresh-button-on = true;
      show-battery-value-on = true;
      show-battery-icon-on = true;
    };
    # Blur my shell configuration
    "org/gnome/shell/extensions/blur-my-shell" = {
      sigma = 10;
      brightness = 0.60;
      noise-amount = 0.20;
    };
    "org/gnome/shell/extensions/blur-my-shell/overview".blur = true;
    "org/gnome/shell/extensions/blur-my-shell/panel".blur = true;
    "org/gnome/shell/extensions/blur-my-shell/applications".blur = false;
  };
}
