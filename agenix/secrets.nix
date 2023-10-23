# See https://github.com/ryantm/agenix#tutorial
let
  agenix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJyOtbyOasyBrcr4PUsalys0QyVas6zz0n4UEl1np6Cg";
  users = [agenix];
in {
  "awscli-credentials.age".publicKeys = users;
  "ssh-clients-config.age".publicKeys = users;
  "docker-config-json.age".publicKeys = users;
  "wg-danielmacbook.age".publicKeys = users;
  "wg-admin.age".publicKeys = users;
  "wg-vpn.mobileconfig.age".publicKeys = users;
}
