{
  config,
  pkgs,
  lib,
  mac-app-util,
  ...
}: {
  home.activation = {
    trampolineApps = let
      apps = pkgs.buildEnv {
        name = "home-manager-applications";
        paths = config.home.packages;
        pathsToLink = "/Applications";
      };
      mac-app-util_ = mac-app-util.packages.${pkgs.stdenv.system}.default;
    in lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      fromDir="${apps}/Applications/"
      toDir="$HOME/Applications/Home Manager Trampolines"
      ${mac-app-util_}/bin/mac-app-util sync-trampolines "$fromDir" "$toDir"
  '';
  };
  imports = [
    ./applications.nix
    ./autostart.nix
    ./docker.nix
  ];
}
