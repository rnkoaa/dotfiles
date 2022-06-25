local utils = require("settings.utils")
local trouble = require("trouble.providers.telescope")

require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  },
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<c-t>"] = trouble.open_with_trouble
      },
      n = {
        ["<c-t>"] = trouble.open_with_trouble
      }
    }
  }
}

-- load ui-select extension
require("telescope").load_extension("ui-select")

--Add leader shortcuts
utils.map("n", "<C-p>", "<Cmd>lua require('telescope.builtin').find_files()<cr>")
-- utils.map("n", "<leader>tf", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
-- utils.map("n", "<C-p>", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
utils.map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
utils.map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
utils.map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

