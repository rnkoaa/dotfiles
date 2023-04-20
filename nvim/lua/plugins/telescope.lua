-- local status, telescope = pcall(require, "telescope")
-- if not status then
-- 	return
-- end

-- local _, builtin = pcall(require, "telescope.builtin")
-- if not builtin_setup then
-- 	return
-- end

return {
	"nvim-telescope/telescope.nvim",
	keys = { -- disable the keymap to grep files
    {"<leader>/", false},
    -- change a keymap
    { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", 
	    function() require("telescope.builtin").live_grep() end, desc = "[S]earch by [G]rep",
    },
    -- { "<leader>fg", function() require("telescope.builtin").live_grep end, desc = "[S]search by [G]rep" },
    -- { "<leader>fh", require("telescope.builtin").help_tags, desc = "[S]search [H]elp" },
    -- { "<leader>fw", require("telescope.builtin").grep_string, desc = "[S]search [C]urrent [W]ord" },
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      desc = "Find Plugin File",
    },
  },

}

