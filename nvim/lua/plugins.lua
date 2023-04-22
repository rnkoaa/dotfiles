return {
	-- plugins
	"MunifTanjim/nui.nvim",
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
		"dsznajder/vscode-es7-javascript-react-snippets",
		build = "yarn install --frozen-lockfile && yarn compile",
	},
}
