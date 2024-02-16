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
    ]
    ++ python311WithPackages;

  programs.pyenv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
