{
  config,
  pkgs,
  libs,
  ...
}: {

  home.packages = with pkgs; [
    gnutar
    iperf
    lego
    netcat
    nmap
    p7zip
    restic
    sops
    watch
    wget
    yq-go
    htop
    btop
    nixd
  ];

  programs = {
    bat = {
      enable = true;
    };

    eza = {
      enable = true;
      enableAliases = true;
      extraOptions = [
        "--icons"
        "--group-directories-first"
        "--group"
        "--header"
        "--mounts"
        "--git"
      ];
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    htop = {
      enable = true;
    };

    info = {
      enable = true;
    };

    jq = {
      enable = true;
    };

    less = {
      enable = true;
    };

    lesspipe = {
      enable = true;
    };

    man = {
      enable = true;
      generateCaches = true;
    };

    mcfly = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      fuzzySearchFactor = 2;
      keyScheme = "vim";
    };

    ripgrep = {
      enable = true;
    };

    tealdeer = {
      enable = true;
      settings = {
        display = {
          use_pager = true;
          compact = true;
        };
        updates = {
          auto_update = true;
        };
      };
    };

    thefuck = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
