
--Set colorscheme (order is important here)
vim.o.termguicolors = true

-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = false
require('nord').set()

-- vim.g.onedark_style = 'darker'
-- vim.g.onedark_terminal_italics = 2
-- require('onedark').setup()

require('lualine').setup {
    options = {
        theme = 'nord'
    }
}
