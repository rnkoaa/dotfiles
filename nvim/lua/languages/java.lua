local map = require('utils').map
local api = vim.api
local M = {}

local function on_attach(_, bufnr)
    require('jdtls.setup').add_commands()
    require'jdtls'.setup_dap()
    require'lsp-status'.register_progress()

    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    local function buf_set_keymap(mode, mapping, command)
        api.nvim_buf_set_keymap(bufnr, mode, mapping, command, opts)
    end

    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    map('n', '<leader>dp', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

    map('n', '<leader>dn', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    -- map('n', '<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    -- map('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    -- map('n', '<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    -- map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    -- map('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    -- map('n', '<leader>lrf', '<cmd>lua vim.lsp.buf.references()<CR>')
    -- map('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    -- map('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
    -- map('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

    -- map('n', '<Leader>d', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', '<Leader>a', [[<Cmd>lua require'jdtls'.code_action()<CR>]], opts)
    map('n', '<Leader><Leader>', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    map('n', 'gdi', "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    map('n', 'gdt', "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    map('n', 'gdn', "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
    map('v', 'gde', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    map('n', 'gde', "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    map('v', 'gdm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
end

local capabilities = {
    workspace = {
        configuration = true,
    },
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true,
            },
        },
    },
}

M.lsp = {
    capabilities = capabilities,
    on_attach = on_attach,
}

M.template = {
    ['1'] = [[
package %s;
public class %s {
}]],
    ['2'] = [[
package %s;
public interface %s {
}]],
}

return M
