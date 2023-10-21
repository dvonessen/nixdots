{
  description = "Home Manager configuration of danielvonessen";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/23.05";
    };
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixpkgs-firefox-darwin = {
      url = "github:bandithedoge/nixpkgs-firefox-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nur,
    nix-darwin,
    home-manager,
    agenix,
    nixpkgs-firefox-darwin,
    nix-vscode-extensions,
    ...
  }:
    let
      username = "danielvonessen";
      userfullname = "Daniel von Eßen";
      usermail = "daniel@vonessen.eu";
      userbusinessmail = "daniel.von-essen@deutschebahn.com";

      aarch64_darwin = "aarch64-darwin";
      allSystems = [ aarch64_darwin ];
    in {
      darwinConfigurations = let
        system = aarch64_darwin;
        specialArgs = {
          inherit username usermail userfullname userbusinessmail;
          pkgs = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              nur.overlay
              nixpkgs-firefox-darwin.overlay
              nix-vscode-extensions.overlays.default
            ];
          };
        } // inputs;

        baseArgs = {inherit agenix nix-darwin home-manager system specialArgs nixpkgs;};
      in
      {
        macdb = import ./hosts/macdb.nix baseArgs;
      };
      formatter = nixpkgs.lib.genAttrs allSystems (
          system: nixpkgs.legacyPackages.${system}.alejandra
      );
    };
}
