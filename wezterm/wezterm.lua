local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 15.0
config.use_ime = true
config.window_background_opacity = 0.75
config.macos_window_background_blur = 20
config.native_macos_fullscreen_mode = false
config.initial_cols = 160
config.initial_rows = 160

----------------------------------------------------
-- Tab
----------------------------------------------------
-- タイトルバーを非表示
config.window_decorations = "RESIZE"
-- タブバーの表示
config.show_tabs_in_tab_bar = true
-- タブが一つの時は非表示
config.hide_tab_bar_if_only_one_tab = true
-- falseにするとタブバーの透過が効かなくなる
-- config.use_fancy_tab_bar = false

-- タブバーの透過
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる
config.window_background_gradient = {
	colors = { "#000000" },
}

-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- nightlyのみ使用可能
-- タブの閉じるボタンを非表示
config.show_close_tab_button_in_tabs = false

config.colors = {
  -- ペイン同士の境界線
  split = "#7aa2f7",

	-- タブ同士の境界線を非表示
	tab_bar = {
		inactive_tab_edge = "none",
	},

	-- セレクション
	selection_bg = "#00ff00",
	selection_fg = "#FFFFFF",
}

-- 非アクティブなペインを暗くする
config.inactive_pane_hsb = {
      saturation = 0.8,
      brightness = 0.60,
}

-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

-- 実行ファイルのパスからプロセス名だけを取得
local function basename(path)
	return path:gsub("(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"
	if tab.is_active then
		background = "#dfff00"
		foreground = "#202020"
	end
	local edge_foreground = background
	local process_name = basename(tab.active_pane.foreground_process_name or "")
	local osc_title = tab.active_pane.title or ""
	-- OSCタイトルの先頭部分を状態名として使用
	local state_name = osc_title:match("^([^:%s]+)")
	local pane_title = state_name and state_name:lower() or process_name
	local title = "   " .. wezterm.truncate_right(pane_title, max_width - 1) .. "   "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

----------------------------------------------------
-- keybinds
----------------------------------------------------
config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
