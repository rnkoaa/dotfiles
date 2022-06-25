local utils = require("settings/utils")
-- explorer
utils.map("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
utils.map("n", "-", ":RnvimrToggle<CR>", { noremap = true, silent = true })

-- better window movement
utils.map("n", "<C-h>", "<C-w>h", { silent = true })
utils.map("n", "<C-j>", "<C-w>j", { silent = true })
utils.map("n", "<C-k>", "<C-w>k", { silent = true })
utils.map("n", "<C-l>", "<C-w>l", { silent = true })

-- escape from insert mode
utils.map("i", "jk", "<ESC>")
utils.map("i", "kj", "<ESC>")
utils.map("i", "jj", "<ESC>")

utils.map("n", "<leader>p", '"_dp')

-- quick splits
utils.map("n", "<leader>v", ":vsplit<CR>")
utils.map("n", "<leader>h", ":split<CR>")

--Remap for dealing with word wrap
local opts = { noremap = true, expr = true, silent = true }
utils.map("n", "k", "v:count == 0 ? 'gk' : 'k'", opts)
utils.map("n", "j", "v:count == 0 ? 'gj' : 'j'", opts)

-- Y yank until the end of line
utils.map("n", "Y", "y$")
-- map('n', '<leader>/', '<cmd>noh<CR>') -- Clear highlights
utils.map("n", "<A-/>", "<cmd>noh<CR>") -- Clear highlights
utils.map("i", "jk", "<Esc>")
utils.map("", "<leader>c", '"+y') --Copy to clipboard in normal, visual, select and operator modes
utils.map("i", "<C-u>", "<C-g>u<C-u>") -- Make <C-u> undo-friendly
utils.map("i", "<C-w>", "<C-g>u<C-w>") -- Make <C-w> undo-friendly

-------------------- MAPPINGS ------------------------------
utils.map("", "<leader>c", '"+y') --Copy to clipboard in normal, visual, select and operator modes
utils.map("i", "<C-u>", "<C-g>u<C-u>") -- Make <C-u> undo-friendly
utils.map("i", "<C-w>", "<C-g>u<C-w>") -- Make <C-w> undo-friendly

-- <Tab> to navigate the completion menu
utils.map("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
utils.map("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })

--- Trouble Key maps
utils.map("n", "<leader>tr", "<cmd>Trouble<cr>",opt)
utils.map("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>",opt)
utils.map("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>",opt)
utils.map("n", "<leader>tl", "<cmd>Trouble loclist<cr>",opt)
utils.map("n", "<leader>tq", "<cmd>Trouble quickfix<cr>",opt)
utils.map("n", "gR", "<cmd>Trouble lsp_references<cr>",opt )
