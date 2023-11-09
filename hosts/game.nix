{
  agenix,
  system,
  specialArgs,
  home-manager,
  nixpkgs,
  ...
}: let
  username = specialArgs.username;
in
  nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ../linux
      ../linux/game/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = specialArgs;
        home-manager.users.${username} = {
          imports = [
            ../home/common
            ../home/linux
          ];
        };
      }
    ];
  }
