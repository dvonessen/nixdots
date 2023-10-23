{agenix, ...}: {
  imports = [
    agenix.darwinModules.default
    ./darwin-secrets.nix
    ./system.nix
    ./wireguard.nix
    ./homebrew.nix
    ./nix.nix
  ];
}
