{
  config,
  pkgs,
  ...
}: {
  homebrew = {
    enable = true;
    caskArgs = {
      appdir = "~/Applications";
    };
    casks = [
      "amazon-workspaces"
      "bitwarden"
      "caffeine"
      "docker"
      "ferdium"
      "firefox"
      "inkscape"
      "keepassxc"
      "libreoffice"
      "nextcloud"
      "onedrive"
      "rectangle"
      "spotify"
      "steam"
      "utm"
      "visual-studio-code"
      "logi-options-plus"
    ];
    global.autoUpdate = false;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };
  };
}
