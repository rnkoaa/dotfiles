-- LSP settings
--https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
--
local nvim_lsp = require("lspconfig")

local M = {}

-- nvim-cmp supports additional completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	require("rnkoaa.mappings").lsp_attach_mapping(client, bufnr)
end

-- Enable the following language servers
local servers = {
	"bashls",
	"cssls",
	"dockerls",
	"jsonls",
	"sqls",
	"tsserver",
	"vimls",
	"yamlls",
}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

M.on_attach = on_attach
M.capabilities = capabilities

return M
