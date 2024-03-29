{
  userfullname,
  usermail,
  userfullbusinessname,
  userbusinessmail,
  ...
}: {
  programs.git = {
    enable = true;
    userName = userfullname;
    userEmail = usermail;
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
          user.email = userbusinessmail;
          user.name = userfullbusinessname;
        };
        condition = "gitdir:~/git/dbsystel/**";
      }
      {
        contents = {
          user.email = userbusinessmail;
          user.name = userfullbusinessname;
        };
        condition = "gitdir:~/git/git.tech.rz.db.de/**";
      }
      {
        contents = {
          user.email = userbusinessmail;
          user.name = userfullbusinessname;
        };
        condition = "gitdir:~/git/gitlab/dbsystel/**";
      }
    ];
    lfs.enable = true;
    diff-so-fancy.enable = true;
  };
}
