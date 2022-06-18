local root_dir = require('jdtls.setup').find_root({'.git', 'gradlew', 'pom.xml'})
-- local local_lsp = require('lsp')
local home = os.getenv('HOME')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/eclipse-workspace/' .. project_name
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  local jdtls = require('jdtls')
  jdtls.setup.add_commands()
  -- require'jdtls.setup'.add_commands()
  -- require'jdtls'.setup_dap()
  -- require'lsp-status'.register_progress()
  -- require'compe'.setup {
  --   enabled = true;
  --   autocomplete = true;
  --   debug = false;
  --   min_length = 1;
  --   preselect = 'enable';
  --   throttle_time = 80;
  --   source_timeout = 200;
  --   incomplete_delay = 400;
  --   max_abbr_width = 100;
  --   max_kind_width = 100;
  --   max_menu_width = 100;
  --   documentation = true;

  --   source = {
  --     path = true;
  --     buffer = true;
  --     calc = true;
  --     vsnip = false;
  --     nvim_lsp = true;
  --     nvim_lua = true;
  --     spell = true;
  --     tags = true;
  --     snippets_nvim = false;
  --     treesitter = true;
  --   };
  -- }

end

local cmd = {
  'java', -- or '/path/to/java11_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  '-Dosgi.bundles.defaultStartLevel=4',
  '-Declipse.product=org.eclipse.jdt.ls.core.product',
  '-Dlog.protocol=true',
  '-Dlog.level=ALL',
  '-Xms1g',
  '--add-modules=ALL-SYSTEM',
  '--add-opens', 'java.base/java.util=ALL-UNNAMED',
  '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  --'--add-modules', 'jdk.incubator.foreign',
  --'--add-modules', 'jdk.incubator.vector',

  -- 💀
  '-jar', vim.fn.glob('/Users/rnkoaa/.config/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_*.jar'),
       -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
       -- Must point to the                                                     Change this to
       -- eclipse.jdt.ls installation                                           the actual version


  -- 💀
  '-configuration', '/Users/rnkoaa/.config/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_mac',
                  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                  -- Must point to the                      Change to one of `linux`, `win` or `mac`
                  -- eclipse.jdt.ls installation            Depending on your system.


  -- 💀
  -- See `data directory configuration` section in the README
  '-data', workspace_dir
}


-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- local capabilities = {
--   workspace = {
--     configuration = true
--   },
--   textDocument = {
--     completion = {
--       completionItem = {
--         snippetSupport = true
--       }
--     }
--   }
-- }
--
capabilities.workspace = { configuration = true}
capabilities.textDocument = {
  completion = {
    completionItem = {
      snippetSupport = true
    }
  }
}

local settings = {
  java = {
    completion = {
      "org.hamcrest.MatcherAssert.assertThat",
      "org.hamcrest.Matchers.*",
      "org.hamcrest.CoreMatchers.*",
      "org.junit.jupiter.api.Assertions.*",
      "java.util.Objects.requireNonNull",
      "java.util.Objects.requireNonNullElse",
      "org.mockito.Mockito.*"
    },
    filteredTypes = {
      "com.sun.*",
      "java.awt.*",
      "jdk.*",
      "sun.*",
    }

  }
}

local config = {
  -- flags = {
  --   allow_incremental_sync = true,
  -- },
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = cmd
}
-- config.cmd = {
--   'launch-jdtls.sh', workspace_dir
-- }

require('jdtls').start_or_attach(config)

-- Custom picker for jdtls

local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'
local pickers = require'telescope.pickers'
local action_state = require'telescope.actions.state'
local cursor_theme = require'telescope.themes'.get_cursor

require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
  local opts = cursor_theme{}
  local iterator = 0
  pickers.new(opts, {
    prompt_title = prompt,
    finder    = finders.new_table {
      results = items,
      entry_maker = function(entry)
        iterator = iterator + 1
        return {
          value = entry,
          display = tostring(iterator) .. ": " .. label_fn(entry),
          ordinal = label_fn(entry),
        }
      end,
    },
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry(prompt_bufnr)

        actions.close(prompt_bufnr)

        cb(selection.value)
      end)

      return true
    end,
  }):find()
end
-- END

-- command! -buffer JdtCompile lua require('jdtls').compile()
-- command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
-- command! -buffer JdtJol lua require('jdtls').jol()
-- command! -buffer JdtBytecode lua require('jdtls').javap()
-- command! -buffer JdtJshell lua require('jdtls').jshell()

-- "" Remaps for jdtls

-- nnoremap <Leader>oi  <Cmd>lua require'jdtls'.organize_imports()<CR>
-- vnoremap <Leader>em  <Esc><Cmd>lua require'jdtls'.extract_method(true)<CR> 
-- nnoremap <Leader>ev  <Esc><Cmd>lua require'jdtls'.extract_variable()<CR> 
-- vnoremap <Leader>ev  <Esc><Cmd>lua require'jdtls'.extract_variable(true)<CR> 
-- nnoremap <Leader>ec  <Cmd>lua require'jdtls'.extract_constant()<CR>
-- vnoremap <Leader>ec  <Esc><Cmd>lua require'jdtls'.extract_constant(true)<CR>
-- nnoremap <Leader>uj  <Esc><Cmd>lua require('jdtls').update_project_config()<CR>
-- nnoremap <Leader>tm  <Esc><Cmd>lua require('jdtls').test_nearest_method()<CR>
-- nnoremap <Leader>tc  <Esc><Cmd>lua require('jdtls').test_class()<CR>

