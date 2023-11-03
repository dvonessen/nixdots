{pkgs, ...}: {
  home.packages = with pkgs; [
    iotop-c
    inotify-tools
    hwinfo
    hdparm
    dmidecode
    compsize
  ];
}
