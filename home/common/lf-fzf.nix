{pkgs, config, ...}: {
  home.file.lf-fzf-preview = {
    enable = true;
    executable = true;
    target = ".config/lf/preview.sh";
    source = ./lib/lf-fzf-preview.sh;
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
        hidden = true;
        drawbox = true;
        icons = true;
        ignorecase = true;
        sixel = true;
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
