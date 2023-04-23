local M = {
  -- "neovim/nvim-lspconfig",
		-- event = { "BufReadPre", "BufNewFile" },
		-- dependencies = {
  --   -- { "b0o/SchemaStore.nvim",version = false, },
		-- 	-- Automatically install LSPs to stdpath for neovim
		-- },
  -- opts = {
  --   servers = {
  --     cssls = {},
  --     dockerls = {},
  --     jsonls = {
        -- on_new_config = function(new_config)
        --   new_config.settings.json.schemas = new_config.settings.json.schemas or {}
        --   vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        -- end,
        -- settings = {
        --   json = {
        --     format = {
        --       enable = true,
        --     },
        --     validate = { enable = true },
        --   },
        -- },
  --     }
  --   }
  -- }
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", config = true },

			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim", config = true },
			"onsails/lspkind-nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
    }, -- end dependencies
  },
{
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- nls.builtins.formatting.fish_indent,
          -- nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          -- nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
   -- cmdline tools and lsp servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        -- "flake8",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}


return M
