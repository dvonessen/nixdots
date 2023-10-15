{
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = [inputs.agenix.packages.${system}.default];

  # if you changed this key, you need to regenerate all encrypt files from the decrypt contents!
  age.identityPaths = [
    "${config.home.homeDirectory}/.ssh/agenix@vonessen.eu"
  ];
  # See https://github.com/ryantm/agenix#reference
}
