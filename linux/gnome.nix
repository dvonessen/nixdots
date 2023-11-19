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
      core-utilities.enable = false;
      gnome-user-share.enable = false;
      gnome-online-accounts.enable = false;
      gnome-browser-connector.enable = false;
      games.enable = false;
    };
  };

  environment.gnome.excludePackages = with pkgs;
  [
    gnome-tour
  ];
}
