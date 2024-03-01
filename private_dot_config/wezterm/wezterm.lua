local wezterm = require("wezterm")
local act = wezterm.action

return {
	initial_rows = 60,
	initial_cols = 240,
	hide_tab_bar_if_only_one_tab = true,
	font = wezterm.font("JetBrains Mono"),
	-- color_scheme = 'Dark Pastel',
	color_scheme = "Catppuccin Mocha", --  " Mocha", -- or Macchiato, Frappe, Latt
	font_size = 14.0,

	window_frame = {
		border_left_width = "0.2cell",
		border_right_width = "0.2cell",
		border_bottom_height = "0.2cell",
		-- border_top_height = '0.25cell',
		border_left_color = "#2a2f3b",
		border_right_color = "#2a2f3b",
		border_bottom_color = "#2a2f3b",
		-- border_top_color = 'lightGray',
	},

	keys = {
		-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
		-- Make Option-Right equivalent to Alt-f; forward-word
		{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },

		{ key = "LeftArrow", mods = "CMD", action = wezterm.action({ SendString = "\x1bOH" }) },
		{ key = "RightArrow", mods = "CMD", action = wezterm.action({ SendString = "\x1bOF" }) },

		{
			key = ",",
			mods = "CMD",
			action = act.SpawnCommandInNewTab({
				cwd = os.getenv("WEZTERM_CONFIG_DIR"),
				set_environment_variables = {
					TERM = "screen-256color",
				},
				args = {
					"/opt/homebrew/bin/nvim",
					os.getenv("WEZTERM_CONFIG_FILE"),
				},
			}),
		},
	},

	window_background_opacity = 0.9,

	-- colors = {
	-- 	-- Make the selection text color fully transparent.
	-- 	-- When fully transparent, the current text color will be used.
	-- 	selection_fg = "none",
	-- 	-- Set the selection background color with alpha.
	-- 	-- When selection_bg is transparent, it will be alpha blended over
	-- 	-- the current cell background color, rather than replace it
	-- 	selection_bg = "rgba(50% 50% 50% 50%)",
	-- },

	automatically_reload_config = true,
}
