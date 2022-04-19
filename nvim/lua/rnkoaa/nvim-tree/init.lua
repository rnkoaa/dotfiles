-- init.lua

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  view = {
    width = 30,
    auto_resize = true,
    auto_close = true,
    side = 'left'
  }
} -- END_DEFAULT_OPTS
