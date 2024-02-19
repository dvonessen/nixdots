{
  config,
  pkgs,
  libs,
  ...
}: {
  home.packages = with pkgs; [
    awscli2
  ];

  programs.bash.initExtra = ''
    source ${pkgs.awscli2}/share/bash-completion/completions/aws.bash
  '';
  programs.zsh.initExtra = ''
    source ${pkgs.awscli2}/share/zsh/site-functions/_aws
  '';

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
