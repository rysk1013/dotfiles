return {
	{
		"simeji/winresizer",
		lazy = false,
		cmd = { "WinResizerStartResize" },
		init = function()
			vim.g.winresizer_start_key = "<C-e>" -- 起動キー
			vim.g.winresizer_vert_resize = 2 -- 垂直方向の変更量
			vim.g.winresizer_horiz_resize = 2 -- 水平方向の変更量
			vim.g.winresizer_gui_enable = 1 -- GUIモードON
		end,
	},
}
