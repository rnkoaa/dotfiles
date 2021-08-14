local utils = require('utils')
local opts = {noremap = true, silent = true}

utils.map('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

-- no hl
utils.map('n', '<Leader>h', ':set hlsearch!<CR>', opts)

-- explorer
utils.map('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)
utils.map('n', '-', ':RnvimrToggle<CR>', opts)

-- better window movement
utils.map('n', '<C-h>', '<C-w>h', {silent = true})
utils.map('n', '<C-j>', '<C-w>j', {silent = true})
utils.map('n', '<C-k>', '<C-w>k', {silent = true})
utils.map('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
-- vim.cmd([[
--   tnoremap <C-h> <C-\><C-N><C-w>h
--   tnoremap <C-j> <C-\><C-N><C-w>j
--   tnoremap <C-k> <C-\><C-N><C-w>k
--   tnoremap <C-l> <C-\><C-N><C-w>l
--   inoremap <C-h> <C-\><C-N><C-w>h
--   inoremap <C-j> <C-\><C-N><C-w>j
--   inoremap <C-k> <C-\><C-N><C-w>k
--   inoremap <C-l> <C-\><C-N><C-w>l
--   tnoremap <Esc> <C-\><C-n>
-- ]])

-- TODO fix this
-- resize with arrows
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize +2<CR>
]])

-- transparent background
-- ColorScheme * hi Normal ctermbg=none guibg=none
-- ColorScheme * hi SignColumn ctermbg=none guibg=none

vim.cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
vim.cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"

-- better indenting
utils.map('v', '<', '<gv', opts)
utils.map('v', '>', '>gv', opts)

-- Tab switch buffer
utils.map('n', '<TAB>', ':bnext<CR>', opts)
utils.map('n', '<S-TAB>', ':bprevious<CR>', opts)

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- I hate escape
utils.map('i', 'jk', '<ESC>')
utils.map('i', 'kj', '<ESC>')
utils.map('i', 'jj', '<ESC>')


utils.map('n', '<leader>p', '"_dp')

-- Y yank until the end of line
utils.map('n', 'Y', 'y$')
utils.map('n', '<C-/>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape

--

-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])

