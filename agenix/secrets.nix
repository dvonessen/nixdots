# See https://github.com/ryantm/agenix#tutorial
let
  agenix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJyOtbyOasyBrcr4PUsalys0QyVas6zz0n4UEl1np6Cg";
  users = [agenix];
in {
  # AWS CLI credentials
  "awscli-credentials.age".publicKeys = users;
  # SSH client configuration
  "ssh-clients-config.age".publicKeys = users;
  # SSH PrivateKeys
  "dvonessen.age".publicKeys = users;
  "dbsystel.age".publicKeys = users;
  "argocd-yggdrasil-luzifer.xyz.age".publicKeys = users;
  "ansible-server.vonessen.eu.age".publicKeys = users;
  # Docker client.json
  "docker-config-json.age".publicKeys = users;
  # WireGuard VPN configuration file
  "wg-danielmacbook.age".publicKeys = users;
  "wg-admin.age".publicKeys = users;
  "wg-vpn.mobileconfig.age".publicKeys = users;
}
