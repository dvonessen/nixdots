{
  systemd.user.startServices = "sd-switch";
  imports = [
    ./coreutils.nix
    ./applications.nix
  ];
}
