{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      tmux-fzf
      better-mouse-mode
    ];
    sensibleOnTop = true;
  };
}
