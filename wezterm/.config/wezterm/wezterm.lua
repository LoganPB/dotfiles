local wezterm = require("wezterm")

config = wezterm.config_builder()
config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBar",
	color_scheme = "tokyonight_day",
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 12.5,
}
return config
