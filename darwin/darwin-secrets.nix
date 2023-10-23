{
  config,
  pkgs,
  agenix,
  username,
  ...
}: {
  environment.systemPackages = [agenix.packages.${pkgs.system}.default];

  # if you changed this key, you need to regenerate all encrypt files from the decrypt contents!
  age.identityPaths = [
    "${config.users.users."${username}".home}/.ssh/agenix@vonessen.eu"
  ];
  # See https://github.com/ryantm/agenix#reference
}
