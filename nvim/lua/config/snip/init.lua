local M = {}

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local types = require("luasnip.util.types")

function M.setup()
	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,

		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { "<-", "Error" } },
				},
			},
		},
	})

	-- Load snippets
	require("luasnip/loaders/from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()

	ls.filetype_extend("all", { "_" })
end

return M
