require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"go",
		"groovy",
		"html",
		"http",
		"java",
		"javascript",
    "javascriptreact",
		"json",
    "jsx",
		"kotlin",
		"lua",
		"markdown",
    "swift",
		"toml",
    "tsx",
		"typescript",
    "typescriptreact",
		"vim",
    "xml",
		"yaml"
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
  indent = {
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

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
