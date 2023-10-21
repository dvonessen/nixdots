{username, ...}: {
  # Create user danielvonessen
  users.users = {
    ${username} = {
      name = username;
      home = "/Users/${username}";
    };
  };
  programs.zsh.enable = true;
  programs.bash.enable = true;
  services.nix-daemon.enable = true;
}
