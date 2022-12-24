require("rnkoaa.plugins.packer")
require("plugins")
require("rnkoaa.plugins.lualine")
require("rnkoaa.plugins.comment")
require("rnkoaa.plugins.gitsigns")
require("rnkoaa.plugins.indent_blankline")
require("rnkoaa.plugins.telescope")
require("rnkoaa.plugins.treesitter")
require("rnkoaa.plugins.neodev")
require("rnkoaa.plugins.cmp")
require("rnkoaa.lsp")

require("rnkoaa.core.settings")
require("rnkoaa.core.colors")
require("rnkoaa.core.keymaps")

-- Turn on lsp status information
require('fidget').setup()


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
