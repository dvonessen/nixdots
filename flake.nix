{
  description = "Home Manager configuration of danielvonessen";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-firefox-darwin = {
      url = "github:bandithedoge/nixpkgs-firefox-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nur,
    darwin,
    home-manager,
    agenix,
    nixpkgs-firefox-darwin,
    nix-vscode-extensions,
    ...
  }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        hostPlatform = system;
        config.allowUnfree = true;
        overlays = [
          nur.overlay
          nixpkgs-firefox-darwin.overlay
          nix-vscode-extensions.overlays.default
        ];
      };
    in
    {
      darwinConfigurations."macdb" = darwin.lib.darwinSystem rec {
        inherit system pkgs;
        modules = [
          ./hosts/macdb.nix
          # home manager
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs system;};
            home-manager.users."danielvonessen" = import ./home/default.nix;
          }
        ];
        specialArgs = {
          inherit inputs system;
        };
      };
      formatter.aarch64-darwin = nixpkgs.legacyPackages.x86_64-darwin.alejandra;
    };
}
