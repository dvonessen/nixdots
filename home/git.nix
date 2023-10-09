{...}: {
  programs.git = {
    enable = true;
    userName = "Daniel von Eßen";
    userEmail = "daniel@vonessen.eu";
    extraConfig = {
      core = {
        autocrlf = "input";
      };
      init = {
        defaultBranch = "main";
      };
      help = {
        autoCorrect = 10;
      };
      credential = {
        "https://git-codecommit.eu-central-1.amazonaws.com" = {
          helper = "!aws codecommit credential-helper $@";
          useHttpPath = "true";
        };
      };
    };
    includes = [
      {
        contents = {
          user.email = "daniel.von-essen@deutschebahn.com";
          user.name = "Daniel von Eßen";
        };
        condition = "gitdir:~/git/dbsystel/**";
      }
      {
        contents = {
          user.email = "daniel.von-essen@deutschebahn.com";
          user.name = "Daniel von Eßen";
        };
        condition = "gitdir:~/git/gitlab/dbsystel/**";
      }
    ];
    lfs.enable = true;
    diff-so-fancy.enable = true;
  };
}
