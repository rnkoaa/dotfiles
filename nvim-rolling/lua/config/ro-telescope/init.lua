local utils = require('utils')

require('telescope').load_extension('fzf')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    find_command = {
        'rg', '--no-heading', '--with-filename', '--line-number', '--column',
        '--smart-case'
    },
    use_less = true,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    extensions = {
        arecibo = {
            ["selected_engine"] = 'google',
            ["url_open_command"] = 'open',
            ["show_http_headers"] = false,
            ["show_domain_icons"] = false
        },
        fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    },
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  }
}
--Add leader shortcuts
-- " Find files using Telescope command-line sugar.
local opts = {noremap = true, silent = true}
utils.map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts )
utils.map('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
utils.map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
utils.map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
utils.map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)

-- map('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})

-- map('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
-- map('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})

-- map('n', '<leader>fss', [[<cmd>:<C-u>SessionSave<cr>]], {noremap = true, silent = true})
-- map('n', '<leader>fsl', [[<cmd>:<C-u>SessionLoad<cr>]], {noremap = true, silent = true})
