{pkgs, ...}: {
  home.packages = with pkgs; [
    keepassxc
    rectangle
    utm
    libreoffice-bin
    pkgsx86_64Darwin.caffeine
  ];
}
