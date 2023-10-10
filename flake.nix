{
  description = "Home Manager configuration of danielvonessen";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    nixpkgs-firefox-darwin = {
      url = "github:bandithedoge/nixpkgs-firefox-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    darwin,
    nixpkgs,
    home-manager,
    ...
  }: {
    darwinConfigurations."macdb" = darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      modules = [
        {
          nixpkgs.overlays = [
            inputs.nixpkgs-firefox-darwin.overlay
            inputs.nur.overlay
          ];
        }
        ./hosts/macdb.nix
        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.users."danielvonessen" = import ./home/default.nix;
        }
      ];
      specialArgs = {
        inherit inputs;
      };
    };
    formatter.aarch64-darwin = nixpkgs.legacyPackages.x86_64-darwin.alejandra;
  };
}
