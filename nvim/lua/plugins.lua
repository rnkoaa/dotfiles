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

	-- use("mhartington/formatter.nvim")
	use("neovim/nvim-lspconfig")
	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind-nvim")

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons"},
  }

  use {
    "davidgranstrom/nvim-markdown-preview"
  }

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

	use("nanotee/sqls.nvim")

	use({ "akinsho/toggleterm.nvim" })

	-- distraction free writing
	use({ "junegunn/goyo.vim" })
  use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
    require("toggleterm").setup()
  end}

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
end)
