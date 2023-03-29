-- [[ Setting oions ]]
-- See `:help vim.o`

-- Set highlight on search
-- vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeo to have a better completion experience
vim.o.completeo = "menuone,noselect"
-- vim.opt.
vim.opt.completeopt = "menu,menuone,noselect"

vim.o.clipboard = "unnamed,unnamedplus" -- allows neovim to access the system clipboard
vim.o.cmdheight = 2 -- more space in the neovim command line for displaying messages

vim.o.backup = false -- creates a backup file
vim.o.colorcolumn = "99999" -- fixes indentline for now
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.fileencoding = "utf-8" -- the encoding written to a file
vim.o.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.o.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.o.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.o.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.o.hlsearch = true -- highlight all matches on previous search pattern
vim.o.incsearch = true -- highlight all matches on previous search pattern
vim.o.ignorecase = true -- ignore case in search patterns
vim.o.mouse = "a" -- allow the mouse to be used in neovim
vim.o.pumheight = 10 -- pop up menu height
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.o.showtabline = 2 -- always show tabs

vim.o.smartindent = true -- make indenting smarter again
vim.o.swapfile = false -- creates a swapfile
-- vim.o.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.title = true -- set the title of window to the value of the titlestring
vim.o.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.o.undofile = true -- enable persistent undo
vim.o.updatetime = 250 -- faster completion
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.o.tabstop = 2 -- insert 2 spaces for a tab
vim.o.cursorline = true -- highlight the current line
vim.o.numberwidth = 4 -- set number column width to 2 {default 4}
vim.o.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.o.wrap = false -- display lines as one long line
vim.o.linebreak = false -- display lines as one long line
vim.o.spell = false
vim.o.spelllang = "en"
vim.o.scrolloff = 8 -- is one of my fav
vim.o.sidescrolloff = 8
--
vim.o.splitright = true
vim.o.splitbelow = true
--
-- Enable break indent
vim.o.breakindent = true
