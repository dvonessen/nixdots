{pkgs, ...}: {
  programs.lf = {
    enable = true;
    previewer.source = "${pkgs.bat}/bin/bat";
  };
}
