{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    amazon-ecr-credential-helper
    docker
    docker-credential-helpers
    hadolint
  ];

  age.secrets.docker-client-json = {
    file = ../../agenix/docker-config-json.age;
    path = "${config.home.homeDirectory}/.docker/config.json";
  };
}
