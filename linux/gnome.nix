{pkgs, ...}: {
  services = {
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
        gnome-console
      ];
    };
  };
}
