-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- explorer
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
keymap.set("n", "-", ":RnvimrToggle<CR>")

-- better window movement
keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- escape from insert mode
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")
keymap.set("i", "jj", "<ESC>")

keymap.set("n", "<leader>p", '"_dp')
keymap.set("n", "x", "_x")
keymap.set("n", "<leader>nl", ":noh<CR>")

-- quick splits
keymap.set("n", "<leader>sv", ":vsplit<CR>")
keymap.set("n", "<leader>sh", ":split<CR>")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Y yank until the end of line
keymap.set("n", "Y", "y$")

keymap.set("n", "<leader>/", "<cmd>noh<CR>") -- Clear highlights
keymap.set("n", "<A-/>", "<cmd>noh<CR>") -- Clear highlights
keymap.set("i", "jk", "<Esc>")
keymap.set("", "<leader>c", '"+y') --Copy to clipboard in normal, visual, select and operator modes
keymap.set("i", "<C-u>", "<C-g>u<C-u>") -- Make <C-u> undo-friendly
keymap.set("i", "<C-w>", "<C-g>u<C-w>") -- Make <C-w> undo-friendly

-------------------- MAPPINGS ------------------------------
keymap.set("", "<leader>c", '"+y') --Copy to clipboard in normal, visual, select and operator modes
keymap.set("i", "<C-u>", "<C-g>u<C-u>") -- Make <C-u> undo-friendly
keymap.set("i", "<C-w>", "<C-g>u<C-w>") -- Make <C-w> undo-friendly

-- <Tab> to navigate the completion menu
keymap.set("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
keymap.set("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })

--- Trouble Key maps
keymap.set("n", "<leader>tr", "<cmd>Trouble<cr>")
keymap.set("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>")
keymap.set("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>")
keymap.set("n", "<leader>tl", "<cmd>Trouble loclist<cr>")
keymap.set("n", "<leader>tq", "<cmd>Trouble quickfix<cr>")
keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>")

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev)
keymap.set("n", "]d", vim.diagnostic.goto_next)
keymap.set("n", "<leader>e", vim.diagnostic.open_float)
keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
