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
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util = {
      url = "github:hraban/mac-app-util";
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
    nixcasks = {
      url = "github:jacekszymanski/nixcasks";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nur,
    nix-darwin,
    mac-app-util,
    home-manager,
    agenix,
    nixpkgs-firefox-darwin,
    nix-vscode-extensions,
    ...
  }: let
    username = "danielvonessen";
    userfullname = "Daniel von Eßen";
    usermail = "daniel@vonessen.eu";
    userbusinessmail = "daniel.von-essen@deutschebahn.com";
    userauthorizedkeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICxOAvpTWpxTYInQ8pI/L84NsyPtj8K6E+bLgSGobzof daniel@vonessen.eu"
    ];

    x64_system = "x86_64-linux";
    aarch64_darwin = "aarch64-darwin";

    allSystems = [aarch64_darwin x64_system];
  in {
    darwinConfigurations = let
      system = aarch64_darwin;
      specialArgs =
        {
          inherit username usermail userfullname userbusinessmail userauthorizedkeys;
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              nur.overlay
              nixpkgs-firefox-darwin.overlay
              nix-vscode-extensions.overlays.default
            ];
            config.packageOverrides = _: {
              nixcasks = inputs.nixcasks.legacyPackages."${system}";
            };
          };
        }
        // inputs;

      baseArgs = {inherit agenix nix-darwin mac-app-util home-manager system specialArgs nixpkgs;};
    in {
      macdb = import ./hosts/macdb.nix baseArgs;
    };

    nixosConfigurations = let
      system = x64_system;
      specialArgs =
        {
          inherit username usermail userfullname userbusinessmail userauthorizedkeys;
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              nur.overlay
              nix-vscode-extensions.overlays.default
            ];
          };
        }
        // inputs;
      baseArgs = {inherit agenix home-manager system specialArgs nixpkgs;};
    in {
      game = import ./hosts/game baseArgs;
    };

    formatter = nixpkgs.lib.genAttrs allSystems (
      system: nixpkgs.legacyPackages.${system}.alejandra
    );
  };
}
