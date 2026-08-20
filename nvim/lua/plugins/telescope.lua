local function get_search_cwd()
  -- Oilの場合
  if vim.bo.filetype == "oil" then
    local dir = require("oil").get_current_dir()
    if dir then
      return dir
    end
  end

  -- 通常ファイルの場合
  local path = vim.api.nvim_buf_get_name(0)
  if path ~= "" then
    return vim.fs.dirname(path)
  end

  -- 新規バッファの場合
  return vim.fn.getcwd()
end

return {
  {
    "nvim-telescope/telescope.nvim",

    version = "*",

    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    keys = {
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files({ cwd = get_search_cwd() }) end,
        mode = "n",
        desc = "Telescope find files (current dir)",
      },
      {
        "<leader>fg",
        function() require("telescope.builtin").live_grep({ cwd = get_search_cwd() }) end,
        mode = "n",
        desc = "Telescope live grep (current dir)",
      },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", mode = "n", desc = "Telescope buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", mode = "n", desc = "Telescope help tags" },
    },

    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          sorting_strategy = "ascending",
        },
      })
    end,
  }
}
