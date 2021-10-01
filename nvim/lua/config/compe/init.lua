-- TODO we need snippet support and to maybe get better docs idk

local utils = require('utils')
-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menuone,noselect'
vim.cmd [[set shortmess+=c]]
utils.opt('o', 'completeopt', 'menuone,noselect')

-- Compe setup
require('compe').setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    allow_prefix_unmatch = false;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

  source = {
    path = true,
    buffer = true,
    calc = false,
    vsnip = false,
    nvim_lsp = true,
    nvim_lua = true,
    luasnip = true,
    -- spell = true;
    -- tags = true;
    -- snippets_nvim = true;
    -- treesitter = true;
  };

  -- source = {
  --   path = true,
  --   nvim_lsp = true,
  --   luasnip = true,
  --   buffer = false,
  --   calc = false,
  --   nvim_lua = false,
  --   vsnip = false,
  --   ultisnips = false,
  -- },
}

-- Utility functions for compe and luasnip
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
local luasnip = require 'luasnip'

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif luasnip.expand_or_jumpable() then
    return t '<Plug>luasnip-expand-or-jump'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  elseif luasnip.jumpable(-1) then
    return t '<Plug>luasnip-jump-prev'
  else
    return t '<S-Tab>'
  end
end

-- Map tab to the above tab complete functiones
utils.map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
utils.map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
utils.map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
utils.map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

-- Map compe confirm and complete functions
utils.map('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
utils.map('i', '<c-space>', 'compe#complete()', { expr = true })
