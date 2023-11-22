{pkgs, ...}: {
  services = {
    # Bolt is used by GNOME 3 to handle Thunderbolt settings.
    hardware.bolt.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;

      # Configure keymap in X11
      layout = "de";
      xkbVariant = "mac_nodeadkeys";

      # Enable the GNOME Desktop Environment.
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome.enable = true;

      # Exclude packages which gets installed as dependencies.
      excludePackages = with pkgs; [
        xterm
      ];
    };

    gnome = {
      core-utilities.enable = true;
      gnome-user-share.enable = false;
      gnome-online-accounts.enable = false;
      gnome-browser-connector.enable = false;
      games.enable = false;
      gnome-initial-setup.enable = false;
      gnome-remote-desktop.enable = false;
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-connections
    gnome-console
    gnome-photos
    gnome-text-editor
    gnome-tour
    gnome.baobab
    gnome.cheese
    gnome.eog
    gnome.epiphany
    gnome.evince
    gnome.geary
    gnome.gnome-calculator
    gnome.gnome-calendar
    gnome.gnome-characters
    gnome.gnome-clocks
    gnome.gnome-contacts
    gnome.gnome-disk-utility
    gnome.gnome-font-viewer
    gnome.gnome-logs
    gnome.gnome-maps
    gnome.gnome-music
    gnome.gnome-system-monitor
    gnome.gnome-weather
    gnome.seahorse
    gnome.simple-scan
    gnome.totem
    gnome.yelp
    gnome.file-roller
    gnome.nautilus
    gnome.sushi
    gnome.gnome-shell-extensions
    orca
  ];
}
