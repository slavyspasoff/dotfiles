local wezterm = require("wezterm")
local action = wezterm.action

local keybindings = {
	{
		key = "f",
		mods = "CTRL|SHIFT",
		action = action.ToggleFullScreen,
	},
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = action.PasteFrom("Clipboard"),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "{",
		mods = "CTRL|SHIFT",
		action = action.ActivatePaneDirection("Left"),
	},
	{
		key = "}",
		mods = "CTRL|SHIFT",
		action = action.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = action.ActivateTabRelative(1),
	},
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = action.ReloadConfiguration,
	},
	{
		key = "PageUp",
		mods = "NONE",
		action = action.ScrollByPage(-1),
	},
	{
		key = "PageDown",
		mods = "NONE",
		action = action.ScrollByPage(1),
	},
	{
		key = "p",
		mods = "SHIFT|CTRL",
		action = action.ActivateCommandPalette,
	},
}

return keybindings
