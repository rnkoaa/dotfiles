-- https://medium.com/prodhacker/my-neovim-setup-for-react-typescript-tailwind-css-etc-in-2022-a7405862c9a4
-- https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887
-- https://github.com/jose-elias-alvarez/typescript.nvim
-- https://github.com/albingroen/nvim-lsp-typescript-config
-- https://blog.ffff.lt/posts/typescript-and-neovim-lsp/
-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").tsserver.setup({
	-- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  capabilities = capabilities
})
