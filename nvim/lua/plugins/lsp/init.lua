--LSP Configuration & Plugins
local M = {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- Additional lua configuration, makes nvim stuff amazing
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", config = true },
			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim", config = true },
			"onsails/lspkind-nvim",
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = { callSnippet = "Replace" },
							telemetry = { enable = false },
							hint = {
								enable = false,
							},
						},
					},
				},
				docker_ls = {},
			},
			setup = {
				lua_ls = function(_, _)
					local lsp_utils = require("plugins.lsp.utils")
					lsp_utils.on_attach(function(client, buffer)
					       -- stylua: ignore
					       if client.name == "lua_ls" then
					         vim.keymap.set("n", "<leader>dX", function() require("osv").run_this() end, { buffer = buffer, desc = "OSV Run" })
					         vim.keymap.set("n", "<leader>dL", function() require("osv").launch({ port = 8086 }) end, { buffer = buffer, desc = "OSV Launch" })
					       end
					end)
				end,
			},
		},
		config = function(plugin, opts)
			require("plugins.lsp.servers").setup(plugin, opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		ensure_installed = {
			"stylua",
			"ruff",
		},
		config = function(plugin)
			require("mason").setup()
			local mr = require("mason-registry")
			for _, tool in ipairs(plugin.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = { ensure_installed = nil, automatic_installation = true, automatic_setup = false },
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
