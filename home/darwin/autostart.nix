{config, ...}: let
  # Autostart some apps installed with homebrew, see ../../darwin/homebrew.nix
  # for a list of installed casks and available autostart options.
  launchAgentPlistConfig = appService:
    builtins.mapAttrs (name: service: {
      enable = true;
      config = {
        Disable = false;
        ProgramArguments = ["/usr/bin/open" "${service.path or "${config.home.homeDirectory}/Applications/Home Manager Trampolines/"}/${service.app}"];
        RunAtLoad = true;
        StandardErrorPath = /. + "/tmp/${name}.err.log";
        StandardOutPath = /. + "/tmp/${name}.out.log";
      };
    })
    appService;
in {
  launchd = {
    enable = true;
    agents = launchAgentPlistConfig {
      "eu.vonessen.bitwarden" = {
        path = "${config.home.homeDirectory}/Applications/";
        app = "Bitwarden.app";
      };
      "eu.vonessen.caffeine" = {
        path = "${config.home.homeDirectory}/Applications/";
        app = "Caffeine.app";
      };
      "eu.vonessen.calendar" = {
        app = "Calendar.app";
        path = "/System/Applications/";
      };
      "eu.vonessen.docker" = {
        path = "${config.home.homeDirectory}/Applications/";
        app = "Docker.app";
      };
      "eu.vonessen.ferdium" = {
        path = "${config.home.homeDirectory}/Applications/";
        app = "Ferdium.app";
      };
      "eu.vonessen.firefox" = {app = "Firefox.app";};
      "eu.vonessen.keepassxc" = {app = "KeePassXC.app";};
      "eu.vonessen.mail" = {
        app = "Mail.app";
        path = "/System/Applications/";
      };
      "eu.vonessen.rectangle" = {app = "Rectangle.app";};
      "eu.vonessen.spotify" = {app = "Spotify.app";};
      "eu.vonessen.vscode" = {app = "Visual Studio Code.app";};
      "eu.vonessen.wezterm" = {app = "WezTerm.app";};
    };
  };
}
