{
  config,
  username,
  ...
}: {
  age.secrets."wg-danielmacbook".file = ../agenix/wg-danielmacbook.age;
  age.secrets."wg-admin".file = ../agenix/wg-admin.age;

  # Install and configure WireGuard App from the Apple app store.
  homebrew.masApps.wireguard = 1451685025;

  # Unfortuntley I didn't find a solution to install the tunnels into
  # the wireguard app, but there is a way to write a mobileconfiguration.
  # But there is no way to automatically install this profile, therefore
  # This profile will be a file which has to be manually installed.
  #
  # 1. Open Finder and go to `/etc/wireguard/wg-vpn.mobileconfig`.
  # 2. Double-click the file to run it.
  # 3. In System Preferences, under "Privacy & Security," find "Profiles."
  # 4. Double-click "Wireguard Home Configuration Profile."
  # 5. Enter your password if prompted, and you're done!
  age.secrets."wg-vpn.mobileconfig" = {
    file = ../agenix/wg-vpn.mobileconfig.age;
    path = "/etc/wireguard/wg-vpn.mobileconfig";
    mode = "440";
    owner = "${username}";
    group = "root";
  };

  # This is the wg-quick configuration of the wireguard tunnels
  networking.wg-quick.interfaces = {
    danielmacbook = {
      address = ["10.60.60.10/32"];
      dns = [
        "10.60.60.1"
        "10.10.10.1"
      ];
      privateKeyFile = config.age.secrets."wg-danielmacbook".path;
      peers = [
        {
          allowedIPs = [
            "0.0.0.0/0"
          ];
          endpoint = "vpn.vonessen.eu:51820";
          publicKey = "OylyXnNAsD+NKAXox71abh1Rj4U5WtNctCjohn69xG8=";
        }
      ];
    };
    adminvpn = {
      address = ["10.50.50.10/32"];
      dns = [
        "10.10.10.1"
      ];
      privateKeyFile = config.age.secrets."wg-admin".path;
      peers = [
        {
          allowedIPs = [
            "0.0.0.0/0"
          ];
          endpoint = "vpn.vonessen.eu:51821";
          publicKey = "OylyXnNAsD+NKAXox71abh1Rj4U5WtNctCjohn69xG8=";
        }
      ];
    };
  };
}
