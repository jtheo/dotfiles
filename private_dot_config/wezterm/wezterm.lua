local wezterm = require 'wezterm'

return {
  initial_rows = 60,
  initial_cols = 240,
  hide_tab_bar_if_only_one_tab = true,
  font = wezterm.font 'JetBrains Mono',
  -- color_scheme = 'Dark Pastel',
  color_scheme = "Catppuccin Mocha", --  " Mocha", -- or Macchiato, Frappe, Latt
  font_size = 14.0,

  window_frame = {
    border_left_width = '0.2cell',
    border_right_width = '0.2cell',
    border_bottom_height = '0.2cell',
    -- border_top_height = '0.25cell',
    border_left_color = '#2a2f3b',
    border_right_color = '#2a2f3b',
    border_bottom_color = '#2a2f3b',
    -- border_top_color = 'lightGray',
  },

  keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  }
}

