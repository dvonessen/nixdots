{pkgs, config, ...}: {
  home.file = {
    lf-fzf-preview = {
      enable = true;
      executable = true;
      target = ".config/lf/preview.sh";
      source = ./lib/lf-fzf-preview.sh;
    };
    lf-icons = {
      enable = true;
      target = ".config/lf/icons";
      source = ./lib/lf-icons;
    };
  };

  home.packages = with pkgs; [
    bat
    glow
    gnutar
    xz
    unzip
    gzip
    unrar
    p7zip
    libcdio
    odt2txt
    catdoc
    python311Packages.docx2txt
    w3m
    exiftool
    poppler_utils
    ffmpegthumbnailer
    imagemagick
    coreutils
    chafa
  ];

  programs = {
    lf = {
      enable = true;
      previewer.source = "${config.home.homeDirectory}/${config.home.file.lf-fzf-preview.target}";
      settings = {
        shell = "zsh";
        hidden = true;
        drawbox = true;
        icons = true;
        ignorecase = true;
        sixel = true;
        dupfilefmt = "%b.%n%e";
        relativenumber = true;
        scrolloff = 10;
        info = "size";
      };
      extraConfig = ''
        $mkdir -p ${config.xdg.cacheHome}/lf
      '';
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      defaultCommand = "${pkgs.fd}/bin/fd --type f";
      defaultOptions = [
        "--preview '${config.home.homeDirectory}/${config.home.file.lf-fzf-preview.target} {}'"
        "--cycle"
        "--border=bold"
      ];
    };
  };
}
