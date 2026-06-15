return {
  {
    "mfussenegger/nvim-dap",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
    },

    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" } },
      { "<leader>dc", function() require("dap").continue() end, { desc = "Debug: Continue" } },
      { "<leader>di", function() require("dap").step_into() end, { desc = "Debug: Step Into" } },
      { "<leader>do", function() require("dap").step_over() end, { desc = "Debug: Step Over" } },
      { "<leader>dO", function() require("dap").step_out() end, { desc = "Debug: Step Out" } },
      { "<leader>dr", function() require("dap").repl.open() end, { desc = "Debug: Open REPL" } },
      { "<leader>dl", function() require("dap").run_last() end, { desc = "Debug: Run Last" } },
      { "<leader>dq", function() require("dap").terminate() end, { desc = "Debug: Terminate" } },
      { "<leader>du", function() require("dapui").toggle() end, { desc = "Debug: Toggle UI" } },
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local debuggers = require("config.dap_debuggers")

      dapui.setup()

      require("nvim-dap-virtual-text").setup()

      require("mason-nvim-dap").setup({
        ensure_installed = vim.tbl_map(function(debugger)
          return debugger.adapter
        end, debuggers),
        automatic_installation = true,
        handlers = {},
      })

      -- Load debugger configuration
      for _, debugger in ipairs(debuggers) do
        require("plugins.daps." .. debugger.config)
      end

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Breakpoint
      vim.api.nvim_set_hl(0, "DapBreakpoint", {
        fg = "#f14c4c",
      })

      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DapBreakpoint",
      })

      -- Current execution line
      vim.api.nvim_set_hl(0, "DapStopped", {
        fg = "#9ece6a",
      })

      vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DapStopped",
      })
    end
  }
}
