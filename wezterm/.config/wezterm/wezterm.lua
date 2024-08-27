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
		return "Unikitty Light (base16)"
	end
end

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config = {
	automatically_reload_config = true,
	enable_tab_bar = true,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBar",
	color_scheme = scheme_for_appearance(get_appearance()),
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 12.5,
	leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{
			mods = "LEADER",
			key = "-",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "=",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "m",
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			mods = "LEADER",
			key = "Space",
			action = wezterm.action.RotatePanes("Clockwise"),
		},
		{
			mods = "LEADER",
			key = "à",
			action = wezterm.action.PaneSelect({
				mode = "SwapWithActive",
			}),
		},
		-- move between split panes
		split_nav("move", "h"),
		split_nav("move", "j"),
		split_nav("move", "k"),
		split_nav("move", "l"),
		-- resize panes
		split_nav("resize", "h"),
		split_nav("resize", "j"),
		split_nav("resize", "k"),
		split_nav("resize", "l"),
	},
}

return config
