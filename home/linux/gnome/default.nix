{pkgs, ...}: {
  imports = [
    ./gnome-shell.nix
    ./peripherals.nix
    ./nautilus.nix
  ];
}
