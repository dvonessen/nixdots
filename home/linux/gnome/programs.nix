{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.file-roller
  ];

  dconf.settings = {
    # Configure file-roller/Archive desktopManager
    "org/gnome/file-roller/ui" = {
      view-sidebar = true;
    };
    "org/gnome/file-roller/listing" = {
      show-path = false;
      list-mode = "as-folder";
    };
  };
}
