vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

require("cmp").setup.buffer({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})
