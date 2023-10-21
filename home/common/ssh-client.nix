{config, ...}: {
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
}
