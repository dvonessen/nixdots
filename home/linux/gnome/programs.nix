{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnome.file-roller
    gnome.eog
    gnome.evince
    gnome.gnome-calculator
    amberol # Music player
  ];

  dconf.settings = {
    # Disable dconf-editor warning
    "ca/desrt/dconf-editor" = {
      show-warning = false;
    };
    # Configure file-roller/Archive desktopManager
    "org/gnome/file-roller/ui" = {
      view-sidebar = true;
    };
    "org/gnome/file-roller/listing" = {
      show-path = false;
      list-mode = "as-folder";
    };
    # Configure Amberol music player
    "io/bassi/Amberol" = {
      background-play = false;
    };
  };
}
