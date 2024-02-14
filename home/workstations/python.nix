{pkgs, ...}: let
  python311WithPackages = with pkgs; [
    (python311.withPackages (ps:
      with ps; [
        ipython
        pip
        pyyaml
      ]))
  ];
in {
  home.packages = with pkgs;
    [
      pipenv
      rye
    ]
    ++ python311WithPackages;

  programs.pyenv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.bash.initExtra = ''
    source ${pkgs.rye}/share/bash-completion/completions/rye.bash
    if [ -f "$HOME/.rye/env" ]; then
      source "$HOME/.rye/env"
    fi
  '';
  programs.zsh.initExtra = ''
    source ${pkgs.rye}/share/zsh/site-functions/_rye
    if [ -f "$HOME/.rye/env" ]; then
      source "$HOME/.rye/env"
    fi
  '';
}
