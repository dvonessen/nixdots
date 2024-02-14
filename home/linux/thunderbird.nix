{
  pkgs,
  nixcasks,
  usermail,
  userfullname,
  ...
}: let
  defaultMailProfile = "mailbox-org";
in {
  accounts = {
    email.accounts."${defaultMailProfile}" = {
      primary = true;
      address = usermail;
      userName = usermail;
      realName = userfullname;
      imap = {
        host = "imap.mailbox.org";
        port = 993;
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
  };

  programs.thunderbird = {
    enable = true;
    package =
      if pkgs.stdenv.isDarwin
      then
        pkgs.runCommand "thunderbird-dummy" {} ''
          mkdir $out
          echo "This is a dummy" > $out/dummy.txt
        ''
      else pkgs.thunderbird;
    profiles."${defaultMailProfile}".isDefault = true;
    # This option disables the warning:
    # Thunderbird packages are not yet supported on Darwin. You can still use
    # this module to manage your accounts and profiles by setting
    # 'programs.thunderbird.package' to a dummy value, for example using
    # 'pkgs.runCommand'.
    #
    # Note that this module requires you to set the following environment
    # variables when using an installation of Thunderbird that is not provided
    # by Nix:
    #
    # export MOZ_LEGACY_PROFILES=1
    # export MOZ_ALLOW_DOWNGRADE=1
    darwinSetupWarning = false;
    settings = {
      "browser.search.region" = "DE";
      "browser.theme.content-theme" = 2;
      "browser.theme.toolbar-theme" = 2;
      "calendar.agenda.days" = 28;
      "calendar.event.defaultlength" = 30;
      "calendar.timezone.local" = "Europe/Berlin";
      "calendar.timezone.useSystemTimezone" = true;
      "calendar.view.dayendhour" = 18;
      "calendar.view.daystarthour" = 7;
      "calendar.view.showLocation" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "mail.shell.checkDefaultClient" = false;
      "mail.spam.manualMark" = true;
      "mail.startup.enabledMailCheckOnce" = true;
      "mail.tabs.autoHide" = false;
      "mail.uidensity" = 0;
      "mail.uifontsize" = 12;
      "mailnews.display.html_as" = 3;
      "network.cookie.cookieBehavior" = 2;
      "network.dns.disablePrefetch" = true;
      "network.predictor.enabled" = false;
      "network.prefetch-next" = false;
      "messenger.status.reportIdle" = false;
      "places.history.enabled" = false;
      "privacy.clearOnShutdown.cache" = true;
      "privacy.donottrackheader.enabled" = true;
      "privacy.purge_trackers.date_in_cookie_database" = 0;
      "pref.privacy.disable_button.view_passwords" = false;
      "pref.privacy.disable_button.view_cookies" = false;
      "searchintegration.enable" = true;
    };
  };
  home.sessionVariables = {
    MOZ_LEGACY_PROFILES = 1;
    MOZ_ALLOW_DOWNGRADE = 1;
  };
}
