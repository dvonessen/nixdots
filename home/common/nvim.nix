{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-code-dark
    ];
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./vim/vimrc.vim)
    ];
  };
}
