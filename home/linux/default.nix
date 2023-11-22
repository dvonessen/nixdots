{
  lib,
  osConfig,
  ...
}: {
  systemd.user.startServices = "sd-switch";
  imports =
    [
      ./coreutils.nix
      ./applications.nix
    ]
    ++ lib.optionals osConfig.services.xserver.desktopManager.gnome.enable [./gnome];
}
