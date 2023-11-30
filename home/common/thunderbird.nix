{pkgs, usermail, userfullname, ...}: {
  accounts.email.accounts.mailbox-org = {
    primary = true;
    address = ${usermail};
    userName = ${usermail};
    realName = ${userfullname};
    aliases = "luzifer@luzifer.xyz";
    imap = {
      host = "imap.mailbox.org";
      imap.port = 993;
    };
    smtp = {
      host = "smtp.mailbox.org";
      port = 465;
      tls = {
        enable = true;
        useStartTls = false;
      };
    };
    signature = {
      showSignature = "append";
      text = "My Signature";
      delimiter = "---";
    };
    thunderbird = {
      enable = true;
    };
  };
}
