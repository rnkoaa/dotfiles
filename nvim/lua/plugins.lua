local use = require("packer").use
require("packer").startup(function()
	-- For Packer
	use("wbthomason/packer.nvim")

	-- Explorer

	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				auto_reload_on_write = true,
				disable_netrw = false,
				hide_root_folder = false,
				hijack_cursor = false,
				hijack_netrw = true,
				hijack_unnamed_buffer_when_opening = false,
				ignore_buffer_on_setup = false,
				open_on_setup = false,
				open_on_setup_file = false,
				open_on_tab = false,
				sort_by = "name",
				update_cwd = false,
				view = {
					width = 30,
					height = 30,
					side = "left",
					preserve_window_proportions = false,
					number = false,
					relativenumber = false,
					signcolumn = "yes",
					mappings = {
						custom_only = false,
						list = {
							-- user mappings go here
						},
					},
				},
				renderer = {
					indent_markers = {
						enable = false,
						icons = {
							corner = "└ ",
							edge = "│ ",
							none = "  ",
						},
					},
					icons = {
						webdev_colors = true,
					},
				},
				hijack_directories = {
					enable = true,
					auto_open = true,
				},
				update_focused_file = {
					enable = false,
					update_cwd = false,
					ignore_list = {},
				},
				ignore_ft_on_setup = {},
				system_open = {
					cmd = nil,
					args = {},
				},
				diagnostics = {
					enable = false,
					show_on_dirs = false,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				filters = {
					dotfiles = false,
					custom = {},
					exclude = {},
				},
				git = {
					enable = true,
					ignore = true,
					timeout = 400,
				},
				actions = {
					use_system_clipboard = true,
					change_dir = {
						enable = true,
						global = false,
					},
					open_file = {
						quit_on_open = false,
						resize_window = false,
						window_picker = {
							enable = true,
							chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
							exclude = {
								filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
								buftype = { "nofile", "terminal", "help" },
							},
						},
					},
				},
				trash = {
					cmd = "trash",
					require_confirm = true,
				},
				log = {
					enable = false,
					truncate = false,
					types = {
						all = false,
						config = false,
						copy_paste = false,
						diagnostics = false,
						git = false,
						profile = false,
					},
				},
			})
		end,
	})

	-- use {
	--   "kyazdani42/nvim-tree.lua",
	--   requires = "kyazdani42/nvim-web-devicons"
	--   config = function()
	--     require "nvim-tree".setup {}
	--   end
	-- }

	use({
		"davidgranstrom/nvim-markdown-preview",
	})
	-- use {
	--   "iamcco/markdown-preview.nvim"
	-- }

	use({
		"folke/which-key.nvim",
	})

	use("mhartington/formatter.nvim")
	use("neovim/nvim-lspconfig")
	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind-nvim")

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("EdenEast/nightfox.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("windwp/nvim-autopairs")
	use("maxmellon/vim-jsx-pretty")
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-lualine/lualine.nvim")
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")

	use("tpope/vim-commentary") -- "gc" to comment visual regions/lines
	use("tpope/vim-surround") -- "ys\"" to surround a text with "", "cs'\"" to change surrounding quotes
	use("tpope/vim-repeat") -- "repeat commands"
	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })

	use("mfussenegger/nvim-jdtls")

	use({ "akinsho/toggleterm.nvim" })

	-- distraction free writing
	use({ "junegunn/goyo.vim" })

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
end)
