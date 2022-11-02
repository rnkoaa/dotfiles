-- https://medium.com/prodhacker/my-neovim-setup-for-react-typescript-tailwind-css-etc-in-2022-a7405862c9a4
-- https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887
-- https://github.com/jose-elias-alvarez/typescript.nvim
-- https://github.com/albingroen/nvim-lsp-typescript-config
-- https://blog.ffff.lt/posts/typescript-and-neovim-lsp/
-- Setup lspconfig.
--
-- Set up completion using nvim_cmp with LSP source

-- local on_attach = require('lsp').on_attach
-- on_attach.client.server_capabilities.document_formatting = false

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	client.server_capabilities.document_formatting = false
	require("rnkoaa.mappings").lsp_attach_mapping(client, bufnr)
end

require("lspconfig").tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})
