--LSP Configuration & Plugins
local M = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"onsails/lspkind-nvim",
			-- Automatically install LSPs to stdpath for neovim
			-- "williamboman/mason.nvim",
			-- "williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "VeryLazy",
		config = true,
	},
}

return M
-- return {
-- opts = function(_, opts) end,
-- table.insert(opts.sections.lualine_x, "😄")
-- servers = {
-- 	jsonls = {},
-- 	lua_ls = {
-- 		settings = {
-- 			Lua = {
-- 				workspace = {
-- 					checkThirdParty = false,
-- 				},
-- 				completion = {
-- 					callSnippet = "Replace",
-- 				},
-- 			},
-- 		},
-- 	},
-- },
-- end,
-- }
