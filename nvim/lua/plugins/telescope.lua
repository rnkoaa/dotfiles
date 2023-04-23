return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"benfowler/telescope-luasnip.nvim",
		"kkharji/sqlite.lua",
		"tsakirist/telescope-lazy.nvim",
	},
	keys = { -- disable the keymap to grep files
		{ "<leader>/", false },
		-- change a keymap
		{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
		{ "<leader>f/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
		{
			"<leader>fp",
			function()
				require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
			end,
			desc = "Find Plugin File",
		},
	},
	config = function(_, _)
		local telescope = require("telescope")
		-- local icons = require("config.icons")
		local actions = require("telescope.actions")
		local actions_layout = require("telescope.actions.layout")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["?"] = actions_layout.toggle_preview,
				-- ["<C-s>"] = custom_actions.visidata,
				-- ["<A-f>"] = custom_actions.file_browser,
			},
			-- n = {
			-- ["s"] = custom_actions.visidata,
			-- ["<A-f>"] = custom_actions.file_browser,
			-- },
		}

		local opts = {
			defaults = {
			--	prompt_prefix = icons.ui.Telescope .. " ",
			--	selection_caret = icons.ui.Forward .. " ",
				mappings = mappings,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					hidden = true,
					find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
				},
				git_files = {
					theme = "dropdown",
					previewer = false,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
				},
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					previewer = false,
					hijack_netrw = true,
					mappings = mappings,
				},
				project = {
					hidden_files = false,
					theme = "dropdown",
				},
			},
		}
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("lazy")
		telescope.load_extension("frecency")
		telescope.load_extension("luasnip")
	end,
}
