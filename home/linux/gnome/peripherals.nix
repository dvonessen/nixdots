{lib, ...}: {
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      source = [
        (lib.hm.gvariant.mkTuple ["xkb" "de+mac_nodeadkeys"])
        (lib.hm.gvariant.mkTuple ["xkb" "de+nodeadkeys"])
      ];
      # Allow rigth <ctrl> to trigger third keyboard level
      xkb-options = ["lv3:switch"];
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
      home = ["<Super>d"];
      search = ["<Super>space"];
    };
  };
}
