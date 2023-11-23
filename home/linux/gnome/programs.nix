{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnome.file-roller
    gnome.eog
    gnome.evince
    gnome.gnome-calculator
    amberol # Music player
    celluloid # MPV video player
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
    # Configure Celluloid video player
    "io/github/celluloid-player/celluloid" = {
      always-use-floating-controls = true;
      csd-enable = true;
      draggable-video-area-enable = true;
      always-autohide-cursor = true;
      always-append-to-playlist = true;
    };
  };
}
