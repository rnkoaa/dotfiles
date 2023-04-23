return {
  "MunifTanjim/nui.nvim",
	"windwp/nvim-ts-autotag",
{
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	keys = { { "gc", mode = { "n", "v" } }, { "gcc", mode = { "n", "v" } }, { "gbc", mode = { "n", "v" } } },
	config = function(_, _)
		local opts = {
			ignore = "^$",
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		}
		require("Comment").setup(opts)
	end,
},
	{
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},
	"nvim-lua/plenary.nvim",
	"tpope/vim-surround", -- "ys\"" to surround a text with "", "cs'\"" to change surrounding quotes
	"tpope/vim-repeat", -- "repeat commands"
	"mattn/emmet-vim",
	"ray-x/lsp_signature.nvim",
	{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		config = {
			integrations = { diffview = true },
		},
		keys = {
			{ "<leader>gs", "<cmd>Neogit kind=floating<cr>", desc = "Status" },
		},
	},
	{
		"b0o/SchemaStore.nvim",
		version = false, -- last release is way too old
	},
	{
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
  {
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
},
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		build = "yarn install --frozen-lockfile && yarn compile",
	},
}
