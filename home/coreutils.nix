{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {

    bat = {
      enable = true;
    };

    eza = {
      enable = true;
      enableAliases = true;
      extraOptions = [
        "--icons"
        "--group-directories-first"
        "--group"
        "--header"
        "--mounts"
        "--git"
      ];
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    htop = {
      enable = true;
    };

    info = {
      enable = true;
    };

    jq = {
      enable = true;
    };
  };
}
