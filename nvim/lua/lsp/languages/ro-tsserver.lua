-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").tsserver.setup({
	-- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  capabilities = capabilities
})
