require'lspconfig'.kotlin_language_server.setup{
    cmd = { "launch-ktls.sh" },
    filetypes = { "kotlin" },
--    root_dir = root_pattern("settings.gradle")
}
