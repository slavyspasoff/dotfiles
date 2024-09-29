local wezterm = require("wezterm")

local M = {}

local catppuccinCustom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
catppuccinCustom.background = "#161925"
catppuccinCustom.tab_bar.background = "#161925"

local draculaCustiom = wezterm.color.get_builtin_schemes()["Dracula (Official)"]
draculaCustiom.background = "#161925"
draculaCustiom.tab_bar.background = "#161925"

M.color_scheme_dirs = {
	"/home/spasoff/.config/wezterm/themes/",
}

M.color_schemes = {
	["Catppuccin Custom"] = catppuccinCustom,
	["Dracula Custom"] = draculaCustiom,
}
M.color_scheme = "Catppuccin Custom"
-- M.color_scheme = 'Dracula Custom'

return M
