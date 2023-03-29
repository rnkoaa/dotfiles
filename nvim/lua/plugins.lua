require("lazy").setup({
	-- Explorer
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	"iamcco/markdown-preview.nvim",
	"folke/which-key.nvim",

	"neovim/nvim-lspconfig",
	"onsails/lspkind-nvim",
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
	},
	{ "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" },
	{
		"lewis6991/gitsigns.nvim",
		tag = "release", -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"L3MON4D3/LuaSnip", -- Snippets plugin
	"rafamadriz/friendly-snippets",
	"honza/vim-snippets",
	"saadparwaiz1/cmp_luasnip",
	"folke/tokyonight.nvim",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"maxmellon/vim-jsx-pretty",
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	"nvim-treesitter/nvim-treesitter",
	"nvim-lualine/lualine.nvim",
	-- Additional textobjects for treesitter
	"nvim-treesitter/nvim-treesitter-textobjects",

	"tpope/vim-surround", -- "ys\"" to surround a text with "", "cs'\"" to change surrounding quotes
	"tpope/vim-repeat", -- "repeat commands"
	"mattn/emmet-vim",

	-- Add indentation guides even on blank lines
	"lukas-reineke/indent-blankline.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },

	"mfussenegger/nvim-jdtls",
	"nanotee/sqls.nvim",

	-- distraction free writing
	{ "junegunn/goyo.vim" },
	{
		"akinsho/toggleterm.nvim",
		tag = "2.4.0",
		config = function()
			require("toggleterm").setup()
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- method signature support
	{
		"ray-x/lsp_signature.nvim",
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		build = "yarn install --frozen-lockfile && yarn compile",
	},
})
