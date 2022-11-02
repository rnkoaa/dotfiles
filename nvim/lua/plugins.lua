local use = require("packer").use
require("packer").startup(function()
	-- For Packer
	use("wbthomason/packer.nvim")

	-- Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use({
		"iamcco/markdown-preview.nvim",
	})

	use({
		"folke/which-key.nvim",
	})

	use("neovim/nvim-lspconfig")
	use("onsails/lspkind-nvim")

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})

	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use({
		"lewis6991/gitsigns.nvim",
		tag = "release", -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	use({
		"sindrets/diffview.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"davidgranstrom/nvim-markdown-preview",
	})

	use({
		"phaazon/mind.nvim",
		branch = "v2.2",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("mind").setup()
		end,
	})

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	use("L3MON4D3/LuaSnip") -- Snippets plugin
  use("rafamadriz/friendly-snippets")
  use("honza/vim-snippets")
	use("saadparwaiz1/cmp_luasnip")

	use("EdenEast/nightfox.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
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

	use("nanotee/sqls.nvim")

	-- distraction free writing
	use({ "junegunn/goyo.vim" })
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- method signature support
	use({
		"ray-x/lsp_signature.nvim",
	})

	use("mattn/emmet-vim")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use({
		"dsznajder/vscode-es7-javascript-react-snippets",
		run = "yarn install --frozen-lockfile && yarn compile",
	})
end)
