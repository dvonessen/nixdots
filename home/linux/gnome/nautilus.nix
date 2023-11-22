{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    gnome.nautilus
    gnome.sushi
  ];

  dconf.settings = {
    "org/gnome/nautilus/icon-view" = {
      captions = ["size" "date_modified" "detailed_type"];
    };

    "org/gnome/nautilus/list-view" = {
      default-zoom-level = "small";
      use-tree-view = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
      show-delete-permanently = false;
      click-policy = "double";
      recursive-search = "always";
      show-image-thumbnails = "always";
      show-directory-item-counts = "local-only";
    };

    "org/gnome/nautilus/compression" = {
      default-compression-format = "zip";
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
      sort-directories-first = true;
    };
  };
}
