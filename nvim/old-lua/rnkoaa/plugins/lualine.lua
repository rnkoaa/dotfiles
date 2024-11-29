return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function(_, opts)
		-- icons_enabled = true,
		-- 		theme = "nightfox",
		opts.icons_enabled = true
		opts.theme = "tokyonight"
		-- table.insert(opts.sections.lualine_x, "😄")
		return opts
	end,
}
