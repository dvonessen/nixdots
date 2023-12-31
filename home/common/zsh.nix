{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Meslo" "FiraCode" "Ubuntu" "UbuntuMono"];})
    less
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    defaultKeymap = "viins";
    dotDir = ".config/zsh";
    initExtraBeforeCompInit = builtins.concatStringsSep "\n" [
      (builtins.readFile ./zsh/zsh-before-compinit.zsh)
    ];
    initExtra = builtins.concatStringsSep "\n" [
      (builtins.readFile ./zsh/zsh-options.zsh)
      (builtins.readFile ./zsh/zsh-exports.zsh)
      (builtins.readFile ./zsh/zsh-bindings.zsh)
      (builtins.readFile ./zsh/zsh-aliases.zsh)
    ];
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "master";
          sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
      {
        name = "zsh-history-substring-search";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-history-substring-search";
          rev = "master";
          sha256 = "GSEvgvgWi1rrsgikTzDXokHTROoyPRlU0FVpAoEmXG4=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "master";
          sha256 = "bD0oKXSw9lucJR+6/O16m7prwA1cP36C0Tvh5mklapw=";
        };
      }
      {
        name = "zsh-completions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-completions";
          rev = "master";
          sha256 = "cxA+WH/dKk00s6HVN+w1sh/1skHvH4Ji+3rLSSNQGJU=";
        };
      }
      {
        name = "collored-man-pages";
        src = ./zsh/plugins;
      }
      {
        name = "sudo";
        src = ./zsh/plugins;
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./zsh/plugins;
        file = "p10k.zsh";
      }
    ];
  };
}
