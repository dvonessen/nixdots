{config, ...}:
  let
    # Autostart some apps installed with homebrew, see ../../darwin/homebrew.nix
    # for a list of installed casks and available autostart options.
    launchAgentPlistConfig = appService:
      builtins.mapAttrs (name: service: {
          enable = true;
          config = {
            Disable = false;
            ProgramArguments = ["/usr/bin/open" "-n" "${service.path or "${config.home.homeDirectory}/Applications/"}${service.app}"];
            RunAtLoad = true;
            StandardErrorPath = /. + "/tmp/${name}.err.log";
            StandardOutPath = /. + "/tmp/${name}.out.log";
          };
      }) appService;
  in {
    launchd = {
      enable = true;
      agents = launchAgentPlistConfig {
        "eu.vonessen.firefox" = { app = "Firefox.app"; };
        "eu.vonessen.bitwarden" = { app = "Bitwarden.app"; };
        "eu.vonessen.rectangle" = { app = "Rectangle.app"; };
        "eu.vonessen.caffeine" = { app = "Caffeine.app"; };
        "eu.vonessen.docker" = { app = "Docker.app"; };
        "eu.vonessen.ferdium" = { app = "Ferdium.app"; };
        "eu.vonessen.spotify" = { app = "Spotify.app"; };
        "eu.vonessen.vscode" = { app = "Visual Studio Code.app"; };
        "eu.vonessen.calendar" = { app = "Calendar.app"; path = "/System/Applications/"; };
        "eu.vonessen.mail" = { app = "Mail.app"; path = "/System/Applications/"; };
      };
    };
  }
