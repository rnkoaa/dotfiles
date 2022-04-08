local utils = require("settings.utils")

-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
	false
)

require("plugins")

require("nvim-autopairs").setup()
require("lspkind").init()

vim.cmd("colorscheme nordfox")

require("lualine").setup({
	theme = "nordfox",
})

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.api.nvim_set_keymap('i', 'jk', "<ESC>", opts)
-- vim.api.nvim_set_keymap('i', 'kj', "<ESC>", opts)

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_char_highlight = "LineNr"
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Telescope
require("lsp")
require("lsp.config.ro-nvimcmp")
-- require("nvim-autopairs.completion.cmp").setup {
--   map_cr = true,
--   map_complete = true,
--   auto_select = true
-- }

require("settings.general")
require("lsp.config.ro-telescope")
require("lsp.languages.ro-tsserver")
require("lsp.languages.ro-kotlin")
require("keymappings")
require("lsp.config.ro-keybindings")
require("lsp.config.ro-formatter")
require("lsp.config.ro-nvimtree")
require("lsp.config.ro-whichkey")
require("lsp.rnkoaa.toggleterm")
require("lsp.rnkoaa.null-ls").setup()
