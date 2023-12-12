{
  config,
  pkgs,
  libs,
  ...
}: {
  home.packages = with pkgs; [
    bandwhich # Alternative bandwith monitor
    btop # better top tool -> aliased to top
    coreutils # GNU Core Utilities
    dig # DNS tools
    erdtree # Rust tree alternative
    fd # fast and simple find alternative
    findutils
    gnutar # GNU version of tar
    htop
    iftop # Bandwith monitor
    inetutils # ping, traceroute, whois, etc
    iperf # network performance tool
    mtools # MS DOS tools
    neofetch # system information tool
    netcat
    nmap # basic nmap but see also rustscan for a simpler tool
    p7zip # 7zip
    pigz # parallel gzip
    restic # backup tool
    rsync
    rustscan # fast nmap alternative
    smartmontools # S.M.A.R.T utility
    sops # encryption tool
    sshfs
    watch
    wget
    xz
    yq-go # like yq/jq but better
    yt-dlp # youtoube downloader
  ];

  programs.zsh.shellAliases = {
    top = "${pkgs.btop}/bin/btop";
    man = "${pkgs.bat-extras.batman}/bin/batman";
  };

  programs.bash.shellAliases = {
    top = "${pkgs.btop}/bin/btop";
    man = "${pkgs.bat-extras.batman}/bin/batman";
  };

  programs = {
    bat = {
      enable = true;
      config = {
        color = "always";
      };
      extraPackages = with pkgs.bat-extras; [
        batman
      ];
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
      enableInstantMode = true;
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
