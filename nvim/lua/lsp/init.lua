local lsp_config = {}
local map = require('utils').map

function lsp_config.on_attach(client, bufnr)
    map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

    map('n', '<leader>dp', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')

    map('n', '<leader>dn', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

    map('n', '<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    map('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    map('n', '<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    map('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n', '<leader>lrf', '<cmd>lua vim.lsp.buf.references()<CR>')
    map('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    map('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
    map('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>')


    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    elseif client.resolved_capabilities.document_range_formatting then
        map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
    end
end

-- symbols-outline.nvim
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false, -- experimental
    position = 'right',
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a"
    },
    lsp_blacklist = {}
}

-- LSP Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = false
    })

-- Send diagnostics to quickfix list
do
    local method = "textDocument/publishDiagnostics"
    local default_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr,
                                        config)
        default_handler(err, method, result, client_id, bufnr, config)
        local diagnostics = vim.lsp.diagnostic.get_all()
        local qflist = {}
        for bufnr, diagnostic in pairs(diagnostics) do
            for _, d in ipairs(diagnostic) do
                d.bufnr = bufnr
                d.lnum = d.range.start.line + 1
                d.col = d.range.start.character + 1
                d.text = d.message
                table.insert(qflist, d)
            end
        end
        vim.lsp.util.set_qflist(qflist)
    end
end

return lsp_config


