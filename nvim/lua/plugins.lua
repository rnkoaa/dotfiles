return {
	-- plugins
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",
	{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},
	{
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
