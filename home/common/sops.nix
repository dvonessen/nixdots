{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [sops];
  age.secrets."sops-keys.txt" = {
    file = ../../agenix/sops-keys.txt;
    path = "${config.xdg.configHome}/sops/age/keys.txt";
  };
}
