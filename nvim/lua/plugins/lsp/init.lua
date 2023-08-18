return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{
				"folke/neodev.nvim",
				opts = {
					library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
				},
			},
			{ "j-hui/fidget.nvim", config = true },
			{ "smjonas/inc-rename.nvim", config = true },
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {
			servers = {
				bashls = {},
				cssls = {},
				dockerls = {},
				docker_compose_language_service = {},
				emmet_ls = {},
				gopls = {},
				gradle_ls = {},
				groovyls = {},
				html = {},
				jsonls = {},
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
				sqlls = {},
				tsserver = {},
				vimls = {},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
			},
			setup = {
				lua_ls = function(_, _)
					local lsp_utils = require("plugins.lsp.utils")
					lsp_utils.on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "lua_ls" then
              vim.keymap.set("n", "<leader>dX", function() require("osv").run_this() end,
              { buffer = buffer, desc = "OSV Run" })
              vim.keymap.set("n", "<leader>dL", function() require("osv").launch({ port = 8086 }) end,
              { buffer = buffer, desc = "OSV Launch" })
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
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		config = function()
			local nls = require("null-ls")
			nls.setup({
				sources = {
					nls.builtins.formatting.stylua,
					-- nls.builtins.formatting.black,
					nls.builtins.formatting.shfmt,
					nls.builtins.diagnostics.ruff.with({ extra_args = { "--max-line-length=180" } }),
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>cd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
			{ "<leader>cD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
		},
	},
	{
		"glepnir/lspsaga.nvim",
		event = "VeryLazy",
		config = true,
	},
	-- { "rafcamlet/nvim-luapad", cmd = { "LuaRun", "Luapad" } },
}
