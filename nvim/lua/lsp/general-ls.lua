local lspconfig = require('lspconfig')
local servers = {
  bashls = {},
  cssls = {
    filetypes = {"css", "scss", "less", "sass"},
    root_dir = lspconfig.util.root_pattern("package.json", ".git")
  },
  -- ghcide = {},
  html = {},
  jsonls = {cmd = {'json-languageserver', '--stdio'}},
  tsserver = {},
  vimls = {}
}

local snippet_capabilities = {
  textDocument = {completion = {completionItem = {snippetSupport = true}}}
}

for server, config in pairs(servers) do
  config.on_attach = on_attach
  -- config.capabilities = vim.tbl_deep_extend('keep', config.capabilities or {}, lsp_status.capabilities, snippet_capabilities)
  lspconfig[server].setup(config)
end

