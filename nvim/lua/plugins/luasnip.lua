return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	-- build = (not jit.os:find("Windows"))
	--     and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
	--   or nil,
	dependencies = {
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
	-- stylua: ignore
	keys = {
		{
			"<C-j>",
			function()
				return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-j>"
			end,
			expr = true,
			remap = true,
			silent = true,
			mode = "i",
			-- "<tab>",
			-- function()
			-- 	return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
			-- end,
			-- expr = true,
			-- silent = true,
			-- mode = "i",
		},
		{
			"<C-j>",
			function()
				require("luasnip").jump(1)
			end,
			mode = "s",
		},
		{
			"<C-k>",
			function()
				require("luasnip").jump(-1)
			end,
			mode = { "i", "s" },
		},
		config = function(_, opts)
			require("luasnip").setup(opts)

			-- local snippets_folder = vim.fn.stdpath("config") .. "/lua/plugins/completion/snippets/"
			-- require("luasnip.loaders.from_lua").lazy_load({ paths = snippets_folder })

			vim.api.nvim_create_user_command("LuaSnipEdit", function()
				require("luasnip.loaders.from_lua").edit_snippet_files()
			end, {})
		end,
		-- {
		-- 	"<tab>",
		-- 	function()
		-- 		require("luasnip").jump(1)
		-- 	end,
		-- 	mode = "s",
		-- },
		-- {
		-- 	"<s-tab>",
		-- 	function()
		-- 		require("luasnip").jump(-1)
		-- 	end,
		-- 	mode = { "i", "s" },
		-- },
	},
}
