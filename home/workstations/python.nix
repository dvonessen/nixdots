{pkgs, ...}: let
  python311WithPackages = with pkgs; [
    (python311.withPackages (ps:
      with ps; [
        ipython
        pip
        pyyaml
        pdm
      ]))
  ];
in {
  home.packages = with pkgs;
    [
      pipenv
      pdm
      rye
    ]
    ++ python311WithPackages;

  programs.bash.initExtra = ''
    if [ -f $HOME/.rye/env ]; then
      source "$HOME/.rye/env"
    fi
    source ${pkgs.rye}/share/bash-completion/completions/rye.bash
  '';
  programs.zsh.initExtra = ''
    if [ -f $HOME/.rye/env ]; then
      source "$HOME/.rye/env"
    fi
    source ${pkgs.rye}/share/zsh/site-functions/_rye
  '';

  programs.pyenv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
