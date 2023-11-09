{
  config,
  pkgs,
  ...
}: let
  shellAliases = {
    bku-sops = "SOPS_AGE_KEY_FILE=${config.age.secrets."bku/keyfile.txt".path} ${pkgs.sops}/bin/sops exec-env ${config.age.secrets."bku/credentials.env".path}";
  };
in {
  age.secrets = {
    "bku/credentials.env" = {
      file = ../../agenix/bku/credentials.env;
      path = "${config.xdg.configHome}/bku/credentials.env";
    };
    "bku/keyfile.txt" = {
      file = ../../agenix/bku/keyfile.txt;
      path = "${config.xdg.configHome}/bku/keyfile.txt";
    };
  };

  programs.zsh.shellAliases = shellAliases;
  programs.bash.shellAliases = shellAliases;
}
