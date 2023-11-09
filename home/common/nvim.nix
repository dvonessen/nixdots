{
  config,
  pkgs,
  ...
}: let
  vscode-theme = pkgs.vimUtils.buildVimPlugin {
    name = "vscode";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "vscode.nvim";
      rev = "563e3f671543ba14f23ccb57020a428add640d02";
      hash = "sha256-rY/oE1NjqVskaeU5eaVQiy08uz3Bg/Z031wVjy3nPBI=";
    };
  };
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-code-dark
      vscode-theme
    ];
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./vim/vimrc.vim)
    ];
  };
}
