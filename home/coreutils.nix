{
  config,
  pkgs,
  libs,
  ...
}: {
  programs.bat = {
    enable = true;
  };

  programs.eza = {
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

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
