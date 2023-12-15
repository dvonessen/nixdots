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


-- For example, changing the color scheme:
return {
  scrollback_lines = 50000,
  color_scheme = scheme_for_appearance(get_appearance()),
  font = wezterm.font('FiraCode Nerd Font', { weight = 450, italic = false })
}
