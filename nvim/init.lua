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
require('nvim-autopairs').setup()

require('plugins')
-- require('lsp_config')

require('nvimtree')
require('keymappings')
require('settings')
require('config.colorscheme')
require('config.compe')
require('config.saga')
require('config.diffview')
require('config.git-signs')
require('config.treesitter')

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

--Set statusbar
-- vim.g.lightline = { colorscheme = 'onedark';
--       active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } };
--       component_function = { gitbranch = 'fugitive#head', };
-- }

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

require('telescope').load_extension('fzf')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    find_command = {
        'rg', '--no-heading', '--with-filename', '--line-number', '--column',
        '--smart-case'
    },
    use_less = true,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    extensions = {
        arecibo = {
            ["selected_engine"] = 'google',
            ["url_open_command"] = 'open',
            ["show_http_headers"] = false,
            ["show_domain_icons"] = false
        },
        fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    },
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  }
}
--Add leader shortcuts
-- " Find files using Telescope command-line sugar.
local opts = {noremap = true, silent = true}
utils.map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts )
utils.map('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
utils.map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
utils.map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
utils.map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)

-- map('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})

-- map('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})

-- map('n', '<leader>fss', [[<cmd>:<C-u>SessionSave<cr>]], {noremap = true, silent = true})
-- map('n', '<leader>fsl', [[<cmd>:<C-u>SessionLoad<cr>]], {noremap = true, silent = true})

-- Change preview window location
vim.g.splitbelow = true

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)


require('lsp')
require('lsp.sumneko-ls')
-- require "gitsigns-nvim"
require("nvim-autopairs").setup()
require("lspkind").init()
require('lsp.go-ls')
require('lsp.general-ls')

require('lualine').setup {
    options = {
        theme = 'onedark'
    }
}

vim.api.nvim_exec([[
  autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
]], false)
vim.api.nvim_exec([[
    autocmd BufWritePre *.{js,tsx,ts} :silent! :Neoformat prettier
]], false)

require('nvim-web-devicons').get_icons()

