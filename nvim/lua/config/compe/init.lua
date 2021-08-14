-- TODO we need snippet support and to maybe get better docs idk

local utils = require('utils')

vim.cmd [[set shortmess+=c]]
utils.opt('o', 'completeopt', 'menuone,noselect')

require'compe'.setup {
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
  -- documentation = true;
  documentation = {
      border = "rounded",
      max_width = 60,
      min_width = 60,
      max_height = math.floor(vim.o.lines * 0.3),
      min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    -- calc = true;
    vsnip = false;
    nvim_lsp = true;
    nvim_lua = true;
    -- spell = true;
    -- tags = true;
    snippets_nvim = true;
    -- treesitter = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- to enable vsnip 
-- https://alpha2phi.medium.com/neovim-lsp-enhanced-a3d313abee65
-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

utils.map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
utils.map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
utils.map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
utils.map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

