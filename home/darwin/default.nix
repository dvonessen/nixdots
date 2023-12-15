{
  config,
  pkgs,
  lib,
  ...
} @ inputs: {
  # For home-manager controlled apps. See
  # https://github.com/nix-community/home-manager/issues/1341
  home.activation = {
    trampolineApps = let
      mac-app-util = inputs.mac-app-util.packages.${pkgs.stdenv.system}.default;
    in
      lib.hm.dag.entryAfter ["writeBoundary"] ''
        fromDir="$HOME/Applications/Home Manager Apps"
        toDir="$HOME/Applications/Home Manager Trampolines"
        ${mac-app-util}/bin/mac-app-util sync-trampolines "$fromDir" "$toDir"
      '';
  };
  imports = [
    ./applications.nix
    ./autostart.nix
  ];
}
