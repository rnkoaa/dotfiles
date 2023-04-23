local M = {
  "neovim/nvim-lspconfig",
		-- event = { "BufReadPre", "BufNewFile" },
		-- dependencies = {
		-- 	-- Additional lua configuration, makes nvim stuff amazing
		-- 	{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
		-- 	{ "folke/neodev.nvim", config = true },
		-- 	-- Useful status updates for LSP
		-- 	{ "j-hui/fidget.nvim", config = true },
  --   { "b0o/SchemaStore.nvim",
  --   version = false, },
		-- 	"onsails/lspkind-nvim",
		-- 	-- Automatically install LSPs to stdpath for neovim
		-- 	"williamboman/mason.nvim",
		-- 	"williamboman/mason-lspconfig.nvim",
		-- 	"hrsh7th/cmp-nvim-lsp",
		-- 	"hrsh7th/cmp-nvim-lsp-signature-help",
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
}


return M
