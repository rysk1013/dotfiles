return {
  {
    "sindrets/diffview.nvim",

    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", "DiffviewToggleFiles" },

    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Git Diff" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Project History" },
      { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
    },

    opts = function()
      local actions = require("diffview.actions")

      return {
        enhanced_diff_hl = true,
        use_icons = true,
        show_help_hints = true,
        watch_index = true,

        view = {
          default = {
            layout = "diff2_horizontal",
            disable_diagnostics = true,
            winbar_info = false,
          },
          merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
            winbar_info = true,
          },
          file_history = {
            layout = "diff2_horizontal",
            disable_diagnostics = true,
          },
        },

        file_panel = {
          listing_style = "tree",
          tree_options = {
            flatten_dirs = true,
            folder_statuses = "only_folded",
          },
          win_config = {
            position = "left",
            width = 30,
          },
        },

        file_history_panel = {
          win_config = {
            position = "bottom",
            height = 16,
          },
        },

        keymaps = {
          view = {
            { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
            { "n", "<Tab>", actions.select_next_entry, { desc = "Next file" } },
            { "n", "<S-Tab>", actions.select_prev_entry, { desc = "Previous file" } },
          },
          file_panel = {
            { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
            { "n", "<cr>", actions.select_entry, { desc = "Open entry" } },
          },
          file_history_panel = {
            { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
          },
        },
      }
    end
  }
}
