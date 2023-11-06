{pkgs, ...}: {
  home.packages = with pkgs; [
    keepassxc
    rectangle
    utm
    libreoffice-bin
  ];
}
