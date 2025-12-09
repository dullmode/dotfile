local wezterm = require 'wezterm'
local config = {}

-- In newer versions of wezterm, you should check the version
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'Shaman'
config.window_background_opacity = 0.95

config.font_size = 9
config.leader = { key = 'q', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
	{
		key = 'r',
		mods = 'LEADER',
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = 'h',
		mods = 'LEADER',
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = 'l',
		mods = 'LEADER',
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = 'n',
		mods = 'LEADER',
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
		key = 'c',
		mods = 'LEADER',
		action = wezterm.action.CopyTo 'Clipboard',
	},
	{
		key = 'v',
		mods = 'LEADER',
		action = wezterm.action.PasteFrom 'Clipboard',
	},
	{
		key = 't',
		mods = 'LEADER',
		action = wezterm.action.SpawnTab 'CurrentPaneDomain',
	},
	{
		-- for claude code
		key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\n")
	},
}

return config
