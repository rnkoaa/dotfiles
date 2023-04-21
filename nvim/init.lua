vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "

require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.autocmds")


-- Example using a list of specs with the default options
--
-- require("plugins")
-- require("rnkoaa.core.keymaps")
-- require("rnkoaa.plugins.comment")
-- require("rnkoaa.core.colors")
-- require("rnkoaa.core.settings")
--
-- require("rnkoaa.plugins.lualine")
-- require("rnkoaa.plugins.gitsigns")
-- require("rnkoaa.plugins.indent_blankline")
-- require("rnkoaa.plugins.telescope")
-- require("rnkoaa.plugins.treesitter")
-- require("rnkoaa.plugins.neodev")
-- require("rnkoaa.plugins.cmp")
-- require("rnkoaa.plugins.lspsaga")
-- require("rnkoaa.plugins.autopairs")
-- require("rnkoaa.plugins.toggleterm")
-- require("rnkoaa.plugins.trouble")
-- require("rnkoaa.plugins.which_key")
--
-- -- lsp, linters and formatters
-- require("rnkoaa.lsp")
-- require("rnkoaa.lsp.lspconfig")
-- require("rnkoaa.plugins.null-ls")
--
-- -- languages
-- require("rnkoaa.lsp.languages.ro-go")
