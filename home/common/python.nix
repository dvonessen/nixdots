{pkgs, ...}:let 
in {
  home.packages = with pkgs; [
    python311
    pipenv
  ];
  
  programs.pyenv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
