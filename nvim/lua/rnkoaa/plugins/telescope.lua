local keymap = vim.keymap

local status, telescope = pcall(require, "telescope")

if not status then
  return
end


local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

local builtin_setup, builtin = pcall(require, "telescope.builtin")
if not builtin_setup then
  return
end
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(telescope.load_extension, 'fzf')

-- See `:help telescope.builtin`
keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

keymap.set('n', '<C-p>', builtin.find_files, { desc = '[S]earch [F]iles' })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

