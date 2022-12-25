require("rnkoaa.plugins.packer")

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
require("rnkoaa.core.keymaps")

require("plugins")
require("rnkoaa.plugins.lualine")
require("rnkoaa.plugins.comment")
require("rnkoaa.plugins.gitsigns")
require("rnkoaa.plugins.indent_blankline")
require("rnkoaa.plugins.telescope")
require("rnkoaa.plugins.treesitter")
require("rnkoaa.plugins.neodev")
require("rnkoaa.plugins.cmp")
require("rnkoaa.plugins.nvim-tree")
require("rnkoaa.lsp")

require("rnkoaa.core.settings")
require("rnkoaa.core.colors")

-- Turn on lsp status information
require('fidget').setup()


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
