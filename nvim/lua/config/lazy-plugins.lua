require("lazy").setup({
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    require("rnkoaa/plugins/neo-tree"),
    require("rnkoaa/plugins/autopairs"),
    require("rnkoaa/plugins/conform"),
    require("rnkoaa/plugins/indent_line"),
    require("rnkoaa/plugins/treesitter"),
    require("rnkoaa/plugins/lspconfig"),
    require("rnkoaa/plugins/telescope"),
    require("rnkoaa/plugins/cmp"),
    require("rnkoaa/plugins/lint"),
    require("rnkoaa/plugins/rose-pine"),
    require("rnkoaa/plugins/toggleterm"),
    require("rnkoaa/plugins/gitsigns"),
    require("rnkoaa/plugins/which-key"),
    require("rnkoaa/plugins/lualine"),
  },

  {
    spec = {
      { import = "plugins.extras.lang.typescript" },
      { import = "plugins.extras.lang.json" },
      { import = "plugins.extras.ui" },
      -- { import = "plugins.extras.formatting.prettier" },
      { import = "plugins" },
    },
    defaults = {
      lazy = false,
    },
    checker = { enabled = false },
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = "⌘",
        config = "🛠",
        event = "📅",
        ft = "📂",
        init = "⚙",
        keys = "🗝",
        plugin = "🔌",
        runtime = "💻",
        require = "🌙",
        source = "📄",
        start = "🚀",
        task = "📌",
        lazy = "💤 ",
      },
    },
  })
-- vim: ts=2 sts=2 sw=2 et
