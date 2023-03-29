local base_lsp = require("rnkoaa.lsp")

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	print("lspconfig plugin not found or registered")
	return
end

local schemastore_status, schemastore = pcall(require, "schemastore")
if not schemastore_status then
	print("unable to load schemastore plugin")
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local servers = {
	bashls = {},
	-- gradle_ls = {
	-- 	settings = {
	-- 		gradleWrapperEnabled = true,
	-- 	},
	-- },

	-- java
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
	--

	-- sqlls
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sqlls
	cssls = {},
	dockerls = {},
	emmet_ls = {
		filetypes = {
			"html",
			"typescriptreact",
			"javascriptreact",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
		},
	},
	eslint = {},
	gopls = {},
	html = {},
	jsonls = {
		settings = {
			json = {
				schemas = schemastore.json.schemas(),
			},
		},
	},
	-- kotlin_language_server = {
	-- 	cmd = { "kotlin-language-server" },
	-- },
	pyright = {},
	vimls = {},
	yamlls = {},
	-- -- rust_analyzer = {},
	-- sumneko_lua = {
	-- 	Lua = {
	-- 		diagnostics = {
	-- 			globals = { "vim" },
	-- 		},
	-- 		workspace = {
	-- 			checkThirdParty = false,
	-- 			-- make language server aware of runtime files
	-- 			library = {
	-- 				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	-- 				[vim.fn.stdpath("config") .. "/lua"] = true,
	-- 			},
	-- 		},
	-- 		telemetry = { enable = false },
	-- 	},
	-- },
}

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				checkThirdParty = false,

				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
		on_attach = base_lsp.on_attach,
		-- settings = servers[server_name],
	})
end

lspconfig.kotlin_language_server.setup({
	on_attach = base_lsp.on_attach,
	capabilities = capabilities,
	filetypes = { "kt", "kts", "kotlin" },
})

lspconfig.tsserver.setup({
	on_attach = base_lsp.on_attach,
	filetypes = { "javascript", "javascriptreact", "typescriptreact", "typescript", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
	root_dir = function()
		return vim.loop.cwd()
	end,
})

lspconfig.yamlls.setup({
	on_attach = base_lsp.on_attach,
	capabilities = capabilities,
	-- ... -- other configuration for setup {}
	settings = {
		-- yaml = {
		--   ... -- other settings. note this overrides the lspconfig defaults.
		--   schemas = {
		--    ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
		--     ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
		--     ["../path/relative/to/file.yml"] = "/.github/workflows/*"
		--     ["/path/from/root/of/project"] = "/.github/workflows/*"
		--   },
		-- },
	},
})

--
--require'lspconfig'.yamlls.setup{
--     on_attach=on_attach,
--     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     settings = {
--         yaml = {
--             schemas = {
--                 ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"]= "conf/**/*catalog*",
--                 ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
--             }
--         }
--     }
-- }
