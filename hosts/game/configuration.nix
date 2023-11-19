{
  agenix,
  pkgs,
  ...
}: {
  imports = [
    agenix.nixosModules.default
    # Include the results of the hardware scan.
    ./secrets.nix
    ./hardware.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable networking
  networking = {
    hostName = "game";
    networkmanager.enable = true;
  };

  services = {
    # Enable the X11 windowing system.
    xserver = {
      videoDrivers = ["amdgpu"];
    };
  };
}
