-- https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/blob/main/lua/lsp/jdtls.lua
--https://github.com/ChrisAmelia/dotfiles/blob/master/nvim/lua/lsp.lua
local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'
local pickers = require'telescope.pickers'

local root_markers = {'build.gradle', 'gradlew', 'pom.xml'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')

local workspace_folder = home .. "/.workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local java = require('languages.java')

local M = {}

-- array of mappings to setup; {<capability_name>, <mode>, <lhs>, <rhs>}

function M.setup()
    -- local on_attach = function(client, bufnr)
    --     print("JDTLS Attached")
    --     require'jdtls.setup'.add_commands()
    --     require'lsp-status'.register_progress()
      -- require'lspkind'.init()
      -- require'lspsaga'.init_lsp_saga()
      -- require'jdtls'.setup_dap()
-- nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>
-- vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>



      -- Kommentary
      -- vim.api.nvim_set_keymap("n", "<leader>/", "<plug>kommentary_line_default", {})
      -- vim.api.nvim_set_keymap("v", "<leader>/", "<plug>kommentary_visual_default", {})


      -- vim.api.nvim_exec([[
      --   augroup FormatAutogroup
      --     autocmd!
      --     autocmd BufWritePost *.java FormatWrite
      --   augroup end
      -- ]], true)

      -- local opts = { noremap=true, silent=true }
    -- local function buf_set_keymap(mode, mapping, command)
      --       api.nvim_buf_set_keymap(bufnr, mode, mapping, command, opts)
      --   end

      --   api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- -- Mappings.
      -- buf_set_keymap('n', '<leader>gz', "<Cmd>lua require('jdtls').code_action()<CR>")
      -- buf_set_keymap('v', '<leader>gz', "<Esc><Cmd>lua require('jdtls').code_action()<CR>")
      -- buf_set_keymap('n', 'A-CR', "<Cmd>lua require('jdtls').code_action()<CR>")
      -- buf_set_keymap('v', 'A-CR', "<Esc><Cmd>lua require('jdtls').code_action()<CR>")
      -- buf_set_keymap('n', '<leader>r', "<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>")

      -- buf_set_keymap('n', 'A-o', "<Cmd>lua require'jdtls'.organize_imports()<CR>")
      -- buf_set_keymap("n", "<leader>jt", "<Cmd>lua require'jdtls'.test_class()<CR>")
      -- buf_set_keymap("n", "<leader>jtn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
      -- buf_set_keymap('n', '<leader>jexv', "<Cmd>lua require('jdtls').extract_variable()<CR>")
      -- buf_set_keymap('v', '<leader>jexv', "<Esc><Cmd>lua require('jdtls').extract_variable()<CR>")
      -- buf_set_keymap('n', '<leader>jexc', "<Cmd>lua require('jdtls').extract_constant()<CR>")
      -- buf_set_keymap('v', '<leader>jexc', "<Esc><Cmd>lua require('jdtls').extract_constant()<CR>")
      -- buf_set_keymap('v', '<leader>jexm', "<Esc><Cmd>lua require('jdtls').extract_method()<CR>")

      -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
      -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
      -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
      -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
      -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
      -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>', opts)
      -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
      -- -- Java specific
      -- buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
      -- buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
      -- buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
      -- buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
      -- buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
      -- buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

      -- buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

      -- vim.api.nvim_exec([[
      --     hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      --     hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      --     hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      --     augroup lsp_document_highlight
      --       autocmd!
      --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      --     augroup END
      -- ]], false)

    -- end


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

    local config = {
        flags = {
            -- allow_incremental_sync = true,
            server_side_fuzzy_completion = true,
        };
        capabilities = capabilities,
        on_attach = java.on_attach,
        cmd = {'launch-jdtls.sh', workspace_folder},
    }

    config.settings = {
        -- on_attach = java.on_attach,
        -- ['java.format.settings.url'] = home .. "/.config/nvim/jdtls/eclipse-java-google-style.xml",
        -- ['java.format.settings.profile'] = "GoogleStyle",
        java = {
          signatureHelp = { enabled = true };
          -- contentProvider = { preferred = 'fernflower' };
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
            -- toString = {
            --   template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            -- }
          };
          configuration = {
            runtimes = {
              {
                name = "JavaSE-11",
                path = home .. "/.sdkman/candidates/java/11.0.12-zulu/",
              },
              {
                name = "JavaSE-17",
                path = home .. "/.sdkman/candidates/java/17-open",
              },
            }
          };
        };
    }
    -- config.cmd = {'launch-jdtls.sh', workspace_folder}
    -- config.on_attach = on_attach
    config.on_init = function(client, _)
        client.notify('workspace/didChangeConfiguration', { settings = config.settings })
    end

    -- local jar_patterns = {
    --     '/dev/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
    --     '/dev/dgileadi/vscode-java-decompiler/server/*.jar',
    --     '/dev/microsoft/vscode-java-test/server/*.jar',
    -- }

    -- local bundles = {}
    -- for _, jar_pattern in ipairs(jar_patterns) do
    --   for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
    --     if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
    --       table.insert(bundles, bundle)
    --     end
    --   end
    -- end

    local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
    config.init_options = {
      -- bundles = bundles;
      extendedClientCapabilities = extendedClientCapabilities;
    }

    -- UI
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
