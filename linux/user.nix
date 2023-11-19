{
  pkgs,
  username,
  userfullname,
  userauthorizedkeys,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users."${username}" = {
    openssh.authorizedKeys.keys = userauthorizedkeys;
    isNormalUser = true;
    description = userfullname;
    extraGroups = ["networkmanager" "wheel"];
  };
}
