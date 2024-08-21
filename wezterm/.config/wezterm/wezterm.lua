local wezterm = require("wezterm")

config = wezterm.config_builder()

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end
function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Sakura"
	else
		return "Sakura (base16)"
	end
end
config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBar",
	color_scheme = scheme_for_appearance(get_appearance()),
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 12.5,
}

return config
