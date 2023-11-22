{pkgs, ...}:{
  home.packages = with pkgs; [
    gnomeExtensions.wintile-windows-10-window-tiling-for-gnome
  ];

  dconf.settings = {
    # List of enabled gnome-shell extensions
    "org/gnome/shell" = {
      enabled-extensions = [
        "wintile@nowsci.com"
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
  };
}
