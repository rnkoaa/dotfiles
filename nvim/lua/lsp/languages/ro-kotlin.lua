require'lspconfig'.kotlin_language_server.setup{
    cmd = "launch-ktls.sh"
    filetypes = { "kotlin" }
    root_dir = root_pattern("settings.gradle")
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
