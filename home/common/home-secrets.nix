{
  config,
  pkgs,
  agenix,
  specialArgs,
  ...
}: {
  home.packages = [agenix.packages.${pkgs.system}.default];

  # if you changed this key, you need to regenerate all encrypt files from the decrypt contents!
  age.identityPaths = [
    "${config.home.homeDirectory}/.ssh/agenix@vonessen.eu"
  ];
  # See https://github.com/ryantm/agenix#reference
}
