{config, pkgs, libs, ...}: {
  # Create user danielvonessen
  users.users = {
    danielvonessen = {
      name = "danielvonessen";
      home = "/Users/danielvonessen";
    };
  };
  programs.zsh.enable = true;
  programs.bash.enable = true;
  services.nix-daemon.enable = true;

  imports = [
    ../darwin/homebrew.nix
  ];
}
