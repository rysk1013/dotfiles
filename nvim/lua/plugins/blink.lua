return {
  {
    "saghen/blink.cmp",

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    version = "*",

    build = "cargo build --release",

    opts = {
      keymap = {
        preset = "default",
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
        },

        menu = {
          border = "rounded",
        },
      },

      signature = {
        enabled = true,
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },

      fuzzy = {
        implementation = "rust",
      },
    },
  },
}
