local map = require('utils').map

map('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
map('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
map('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- better window movement
map('n', '<C-h>', '<C-w>h', {silent = true})
map('n', '<C-j>', '<C-w>j', {silent = true})
map('n', '<C-k>', '<C-w>k', {silent = true})
map('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- TODO fix this
-- resize with arrows
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize -2<CR>
  nnoremap <silent> <C-Right> :vertical resize +2<CR>
]])

-- better indenting
map('v', '<', '<gv', {noremap = true, silent = true})
map('v', '>', '>gv', {noremap = true, silent = true})


-- Tab switch buffer
map('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
map('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
map('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- I hate escape
map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')
map('i', 'jj', '<ESC>')

map('n', '<leader>p', '"_dp')

-- Y yank until the end of line
map('n', 'Y', 'y$')
-- map('n', '<leader>/', '<cmd>noh<CR>') -- Clear highlights
map('n', '<A-/>', '<cmd>noh<CR>') -- Clear highlights
map('i', 'jk', '<Esc>')           -- jk to escape


-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])

-------------------- MAPPINGS ------------------------------
map('', '<leader>c', '"+y')       --Copy to clipboard in normal, visual, select and operator modes
map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly

-- Markdown Preview
map('n', '<M-p>', ':MarkdownPreview<CR>', {noremap = true, silent = true})
