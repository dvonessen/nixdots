{config, username, ...}: {
  programs.ssh = {
    enable = true;
    compression = true;
    controlMaster = "auto";
    controlPersist = "yes";
    forwardAgent = true;
    hashKnownHosts = false;
    serverAliveInterval = 10;
    serverAliveCountMax = 6;
    includes = [
      config.age.secrets.ssh-clients-config.path
    ];
  };

  age.secrets.ssh-clients-config = {
    file = ../../agenix/ssh-clients-config.age;
    path = "${config.home.homeDirectory}/.ssh/clients.config";
  };

  age.secrets = {
    dvonessen = {
      file = ../../agenix/dvonessen.age;
      path = "${config.home.homeDirectory}/.ssh/dvonessen";
      #owner = "${username}";
      mode = "600";
    };
    dbsystel = {
      file = ../../agenix/dbsystel.age;
      path = "${config.home.homeDirectory}/.ssh/dbsystel";
      #owner = "${username}";
      mode = "600";
    };
    argocd = {
      file = ../../agenix/argocd-yggdrasil-luzifer.xyz.age;
      path = "${config.home.homeDirectory}/.ssh/argocd@yggdrasil@luzifer.xyz";
      #owner = "${username}";
      mode = "600";
    };
    ansible = {
      file = ../../agenix/ansible-server.vonessen.eu.age;
      path = "${config.home.homeDirectory}/.ssh/ansible@server.vonessen.eu.age";
      #owner = "${username}";
      mode = "600";
    };
  };
}
