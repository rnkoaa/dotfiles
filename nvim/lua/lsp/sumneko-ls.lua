local DATA_PATH = vim.fn.stdpath('data')
local lspconfig = require('lspconfig')

local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"
lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  -- cmd = {sumneko_root_path .. sumneko_binary_path, "-E", sumneko_root_path.."/main.lua" };
  on_attach = on_attach,
  settings = {
      Lua = {
          runtime = {
              version = 'LuaJIT',
              path = vim.split(package.path, ';'),
          },
          diagnostics = {
              globals = {'vim'},
          },
          workspace = {
              library = {
                  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              },
          },
      },
  },
}

