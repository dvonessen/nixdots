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
    ]
    ++ python311WithPackages;

  programs.pyenv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
