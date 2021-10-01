-- Install packer
local execute = vim.api.nvim_command
local DATA_PATH = vim.fn.stdpath('data')

local map = require('utils').map
local utils = require('utils')

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

-- auto pairs 
-- https://github.com/windwp/nvim-autopairs

require('plugins')

require('lsp')
require('lsp.sumneko-ls')
require("nvim-autopairs").setup()
require("lspkind").init()
require('lsp.general-ls')
require('lsp.go-ls')

-- start jdtls for java files
vim.api.nvim_exec([[
  augroup jdtls
    autocmd!
    autocmd FileType java lua require'lsp.java-ls'.setup()
  augroup end
]], false)


require('nvimtree')
require('keymappings')
require('settings')
require('config.colorscheme')
require('config.ro-telescope')
-- require('config.compe')
require('config.autopairs')
require('config.saga')
-- require('config.diffview')
require('config.git-signs')
require('config.treesitter')
require('config.ro-formatter')

--Incremental live completion
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.cmd[[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 200
vim.wo.signcolumn="yes"

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

--Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)

--Add map to enter paste mode
vim.o.pastetoggle="<F3>"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == 'a' then
    vim.cmd[[IndentBlanklineDisable]]
    vim.wo.signcolumn='no'
    vim.o.mouse = 'v'
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd[[IndentBlanklineEnable]]
    vim.wo.signcolumn='yes'
    vim.o.mouse = 'a'
    vim.wo.number = true
    print("Mouse enabled")
  end
end

utils.map('n', '<F10>', '<cmd>lua ToggleMouse()<cr>')

-- Telescope


-- Change preview window location
vim.g.splitbelow = true

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)


vim.api.nvim_exec([[
    autocmd BufWritePre *.{js,tsx,ts} :silent! :Neoformat prettier
]], false)



require('nvim-web-devicons').get_icons()

-- open ultisnips in vertical mode
vim.g.UltiSnipsEditSplit="vertical"




