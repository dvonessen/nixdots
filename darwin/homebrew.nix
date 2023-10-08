{config, pkgs, ...}: {
  homebrew = {
    enable = true;
    caskArgs = {
      appdir = "~/Applications";
      require_sha = true;
    };
    casks = [
      # "amazon-workspaces"
      # "apache-directory-studio"
      # "bitwarden"
      # "caffeine"
      # "docker"
      # "ferdium"
      "firefox"
      # "font-fira-code"
      # "inkscape"
      # "keepassxc"
      # "libreoffice"
      # "nextcloud"
      # "origin"
      # "rectangle"
      # "spotify"
      # "steam"
      # "utm"
      # "visual-studio-code"
      # "wireshark"
    ];
    global.autoUpdate = false;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "none"; # Set it to zap, as soon as everything is in home-manager/nix-darwin.
    };
  };
}
