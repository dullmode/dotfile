local wezterm = require 'wezterm'
local config = {}

-- In newer versions of wezterm, you should check the version
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- color_scheme = 'Catppuccin Mocha',
config.window_background_opacity = 0.8
config.font_size = 9
config.keys = {
	{
		key = 'r',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = 'h',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = 'l',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = 't',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.PromptInputLine {
			description = 'Enter new name for tab',
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		},
	},
	{
		-- for claude code
		key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\n")
	},


}

return config
