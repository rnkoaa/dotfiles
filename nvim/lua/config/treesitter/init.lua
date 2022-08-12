require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"http",
		"go",
		"bash",
		"css",
		"html",
		"dockerfile",
		"groovy",
		"java",
		"json",
		"yaml",
		"kotlin",
		"javascript",
		"lua",
		"toml",
		"vim",
		"typescript",
		"markdown",
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
	},
	rainbow = {
		enable = true,
	},
})
