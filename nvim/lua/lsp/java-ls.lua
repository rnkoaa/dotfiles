local map = require('utils').map
local M = {}

function M.setup()
    local on_attach = function(client, bufnr)

        map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        map('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>', opts)
        map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

        -- Java specific
        -- map("n",  "<A-CR>", "<Cmd>lua require'jdtls'.code_action()<CR>", opts)
        -- map('v', '<A-CR>', "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>", opts)
        -- map('n', '<A-o>', "<Cmd>lua require('jdtls').organize_imports()<CR>", opts)
        -- map('n', '<leader>r' "<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>", opts)
        -- map("n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
        map("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
        map("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
        map("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
        map("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
        map("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
        map("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

        -- map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

        -- vim.api.nvim_exec([[
        --     hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        --     hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        --     hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        --     augroup lsp_document_highlight
        --         autocmd!
        --         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        --         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        --     augroup END
        -- ]], false)
    end

    local root_markers = {'.git', 'gradlew', 'pom.xml'}
    local root_dir = require('jdtls.setup').find_root(root_markers)
    local home = os.getenv('HOME')

    local capabilities = {
        workspace = {
            configuration = true
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    }

    local workspace_folder = home .. "/.local/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    local config = {
        flags = {
          allow_incremental_sync = true,
        };
        capabilities = capabilities,
        on_attach = on_attach,
    }
    config.settings = {
        ['java.format.settings.url'] = home .. "/.config/nvim/language-servers/java-google-formatter.xml",
        ['java.format.settings.profile'] = "GoogleStyle",
        java = {
          signatureHelp = { enabled = true };
          contentProvider = { preferred = 'fernflower' };
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*"
            }
          };
          sources = {
            organizeImports = {
              starThreshold = 9999;
              staticStarThreshold = 9999;
            };
          };
          codeGeneration = {
            toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            }
          };
          configuration = {
            runtimes = {
              {
                name = "JavaSE-11",
                path = home .. "/.sdkman/candidates/java/11.0.12-zulu/",
              },
              {
                name = "JavaSE-16",
                path = home .. "/.sdkman/candidates/java/16.0.2-zulu/",
              },
            }
          };
        };
    }
    config.cmd = {'launch-jdtls.sh', workspace_folder}
    config.on_attach = on_attach
    config.on_init = function(client, _)
        client.notify('workspace/didChangeConfiguration', { settings = config.settings })
    end

    local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
    config.init_options = {
      -- bundles = bundles;
      extendedClientCapabilities = extendedClientCapabilities;
    }

    local finders = require'telescope.finders'
    local sorters = require'telescope.sorters'
    local actions = require'telescope.actions'
    local pickers = require'telescope.pickers'
    require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
      local opts = {}
      pickers.new(opts, {
        prompt_title = prompt,
        finder    = finders.new_table {
          results = items,
          entry_maker = function(entry)
            return {
              value = entry,
              display = label_fn(entry),
              ordinal = label_fn(entry),
            }
          end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr)
          actions.goto_file_selection_edit:replace(function()
            local selection = actions.get_selected_entry(prompt_bufnr)
            actions.close(prompt_bufnr)

            cb(selection.value)
          end)

          return true
        end,
      }):find()
    end

    -- Server
    require('jdtls').start_or_attach(config)
    
end

return M
