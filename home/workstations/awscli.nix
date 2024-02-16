{
  config,
  pkgs,
  libs,
  ...
}: {
  home.packages = with pkgs; [
    awscli2
  ];
  age.secrets = {
    "awscli-credentials" = {
      file = ../../agenix/awscli-credentials.age;
      path = "${config.home.homeDirectory}/.aws/credentials";
    };
    "awscli-config" = {
      file = ../../agenix/awscli-config.age;
      path = "${config.home.homeDirectory}/.aws/config";
    };
  };
}
