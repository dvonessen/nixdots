{
  config,
  pkgs,
  libs,
  ...
}: {
  home.packages = with pkgs; [
    awscli
  ];
  home.file = {
    awscli-config = {
      text = ''
        [default]
        output=json
        region=eu-central-1
      '';
      target = "./.aws/config";
    };
  };
  age.secrets = {
    "awscli-credentials" = {
      file = ../../agenix/awscli-credentials.age;
      path = "${config.home.homeDirectory}/.aws/credentials";
    };
  };
}
