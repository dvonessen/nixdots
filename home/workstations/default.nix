{...}: {
  imports = [
    ./applications.nix
    ./awscli.nix
    ./docker.nix
    ./ghorg.nix
    ./git.nix
    ./nodejs.nix
    ./python.nix
    ./sops.nix
    ./ssh-client.nix
    ./tmux.nix
    ./vscode.nix
    ./wezterm.nix
    ./wireguard.nix
  ];
}
