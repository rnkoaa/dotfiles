local wk = require('which-key')

local mappings = {
	q = { ":q<cr>", "Quit"},
	f = { ":Telescope find_files<cr>", "find files"},
	b = { ":Telescope buffers<cr>", "Buffers"},
	g = { ":Telescope live_grep<cr>", "Grep"},
	w = { ":w<cr>", "Save"}
}
local opts = {
	prefix = '<leader>'
}

wk.register(mappings,opts)
