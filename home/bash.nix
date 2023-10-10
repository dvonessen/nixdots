{
  config,
  pkgs,
  libs,
  ...
}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];
    historyFile = "$XDG_CACHE_HOME/bash_history";
    historyFileSize = 100000;
    historySize = 100000;
    initExtra = builtins.concatStringsSep "\n" [
      (builtins.readFile ./zsh/zsh-aliases.zsh)
    ];
  };
}
