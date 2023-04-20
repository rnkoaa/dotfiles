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

-- import mason-lspconfig plugin safely
-- local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
-- if not mason_lspconfig_status then
-- 	return
-- end

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
	dockerls = {},
	eslint = {},
	-- clangd = {},
	gopls = {},
	pyright = {},
	-- 	require'lspconfig'.groovyls.setup{
	--     -- Unix
	--     cmd = { "java", "-jar", "path/to/groovyls/groovy-language-server-all.jar" },
	--     ...
	-- }
	-- gradle_ls = {
	-- 	settings = {
	-- 		gradleWrapperEnabled = true,
	-- 	},
	-- },
	html = {},

	-- java
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
	--
	-- kotlin_language_server
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#kotlin_language_server

	-- sqlls
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sqlls

	cssls = {},
	jsonls = {
		settings = {
			json = {
				schemas = schemastore.json.schemas(),
			},
		},
	},
	yamlls = {},
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
	vimls = {},
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
				-- library = vim.api.nvim_get_runtime_file("", true),
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
