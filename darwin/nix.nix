{
  pkgs,
  lib,
  ...
}: {
  # enable flakes globally
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    # Manual optimise storage: nix-store --optimise
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
    auto-optimise-store = true;
    # Disable: warning: Git tree 'PATH' is dirty
    warn-dirty = false;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Follow the instance of this flakes nixpkgs
  nix.package = pkgs.nix;

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 1w";
  };
}
