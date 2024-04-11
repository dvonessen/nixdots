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
      {
        name = "amazon-workspaces";
        greedy = true;
      }
      {
        name = "bitwarden";
        greedy = true;
      }
      {
        name = "docker";
        greedy = true;
      }
      {
        name = "ferdium";
        greedy = true;
      }
      {
        name = "logi-options-plus";
        greedy = true;
      }
      {
        name = "nextcloud";
        greedy = true;
      }
      {
        name = "onedrive";
        greedy = true;
      }
      {
        name = "microsoft-remote-desktop";
        greedy = true;
      }
    ];
    global.autoUpdate = false;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };
  };
}
