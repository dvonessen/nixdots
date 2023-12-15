{
  nix-darwin,
  home-manager,
  specialArgs,
  system,
  agenix,
  ...
}: let
  username = specialArgs.username;
in
  nix-darwin.lib.darwinSystem {
    inherit system specialArgs;
    modules = [
      ../darwin

      # home manager
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = specialArgs;
        home-manager.users.${username} = {
          imports = [
            ../home/common
            ../home/workstations
            ../home/darwin
            ../home/work
          ];
        };
      }
    ];
  }
