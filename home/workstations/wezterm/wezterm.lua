-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Vs Code Dark+ (Gogh)'
  else
    return 'Vs Code Light+ (Gogh)'
  end
end

-- https://github.com/wez/wezterm/issues/1742#issuecomment-1075333507
-- If coursor is not visible in gnome sessions on wayland
local xcursor_size = nil
local xcursor_theme = nil

local success, stdout, stderr = wezterm.run_child_process({"gsettings", "get", "org.gnome.desktop.interface", "cursor-theme"})
if success then
  xcursor_theme = stdout:gsub("'(.+)'\n", "%1")
end

local success, stdout, stderr = wezterm.run_child_process({"gsettings", "get", "org.gnome.desktop.interface", "cursor-size"})
if success then
  xcursor_size = tonumber(stdout)
end
-- END

-- Return config object
return {
  xcursor_theme = xcursor_theme,
  xcursor_size = xcursor_size,
  scrollback_lines = 50000,
  color_scheme = scheme_for_appearance(get_appearance()),
  font = wezterm.font('FiraCode Nerd Font', { weight = 450, italic = false })
}
