{pkgs, ...}:{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = ''
      -- Pull in the wezterm API
      local wezterm = require 'wezterm'

      -- This table will hold the configuration.
      local config = {}

      -- In newer versions of wezterm, use the config_builder which will
      -- help provide clearer error messages
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      -- This is where you actually apply your config choices

      -- For example, changing the color scheme:
      config.scrollback_lines = 50000
      config.color_scheme = 'GitHub Dark'

      -- and finally, return the configuration to wezterm
      return config
    '';
  };
}
