--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
require("plugins")

require("rnkoaa.core.keymaps")
require("rnkoaa.plugins.comment")
require("rnkoaa.core.settings")
require("rnkoaa.core.colors")

require("rnkoaa.plugins.lualine")
require("rnkoaa.plugins.gitsigns")
require("rnkoaa.plugins.indent_blankline")
require("rnkoaa.plugins.telescope")
require("rnkoaa.plugins.treesitter")
-- require("rnkoaa.plugins.neodev")
require("rnkoaa.plugins.cmp")
require("rnkoaa.plugins.nvim-tree")

-- lsp, linters and formatters
require("rnkoaa.lsp")
require("rnkoaa.lsp.mason")
require("rnkoaa.lsp.lspconfig")
require("rnkoaa.plugins.null-ls")

-- Turn on lsp status information
-- require('fidget').setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
