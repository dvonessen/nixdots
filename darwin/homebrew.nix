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
      "nextcloud"
      "onedrive"
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
