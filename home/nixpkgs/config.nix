{
  allowUnfree = true;
  environment.pathsToLink = [
    "/share"
    "/share/bash-completion"
  ];
  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}
