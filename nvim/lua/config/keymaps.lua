local function map(mode, lhs, rhs, opts)
	local keys = require("lazy.core.handler").handlers.keys
	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- better window movement
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- escape from insert mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jj", "<ESC>")

-- better  viewing
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "g,", "g,zvzz")
map("n", "g;", "g;zvzz")

-- save
map("i", "<leader>ww", "<cmd>w<cr>")
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>p", '"_dp')
map("v", "p", '"_dP')

-- quick splits
map("n", "<leader>v", ":vsplit<CR>")
map("n", "<leader>h", ":split<CR>")

-- Better indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move Lines
map("n", "<A-j>", ":m .+1<CR>==")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Resize window using <shift> arrow keys
map("n", "<S-Up>", "<cmd>resize +2<CR>")
map("n", "<S-Down>", "<cmd>resize -2<CR>")
map("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

--Remap for dealing with word wrap
-- local opts = { noremap = true, expr = true, silent = true }
-- map("n", "k", "v:count == 0 ? 'gk' : 'k'", opts)
-- map("n", "j", "v:count == 0 ? 'gj' : 'j'", opts)

-- Y yank until the end of line
-- map("n", "Y", "y$")
-- map('n', '<leader>/', '<cmd>noh<CR>') -- Clear highlights
-- map("n", "<A-/>", "<cmd>noh<CR>") -- Clear highlights
-- map("i", "jk", "<Esc>")
-- map("", "<leader>c", '"+y') --Copy to clipboard in normal, visual, select and operator modes
-- map("i", "<C-u>", "<C-g>u<C-u>") -- Make <C-u> undo-friendly
-- map("i", "<C-w>", "<C-g>u<C-w>") -- Make <C-w> undo-friendly

-------------------- MAPPINGS ------------------------------
-- map("", "<leader>c", '"+y') --Copy to clipboard in normal, visual, select and operator modes
-- map("i", "<C-u>", "<C-g>u<C-u>") -- Make <C-u> undo-friendly
-- map("i", "<C-w>", "<C-g>u<C-w>") -- Make <C-w> undo-friendly

-- <Tab> to navigate the completion menu
-- map("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
-- map("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })

--- Trouble Key maps
-- map("n", "<leader>tr", "<cmd>Trouble<cr>",opt)
-- map("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>",opt)
-- map("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>",opt)
-- map("n", "<leader>tl", "<cmd>Trouble loclist<cr>",opt)
-- map("n", "<leader>tq", "<cmd>Trouble quickfix<cr>",opt)
-- map("n", "gR", "<cmd>Trouble lsp_references<cr>",opt )

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
--[[
if Util.has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
--]]

-- map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / clear hlsearch / diff update" }
-- )

-- map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")

-- save file
-- map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")

-- lazy
-- map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
-- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
--
-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- quit
-- map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- end

-- windows
-- map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
-- map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
-- map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
-- map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- tabs
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
