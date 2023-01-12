local which_key_status, which_key = pcall(require, "which-key")

if not which_key_status then
	print("which key was not loaded.")
	return
end

local mappings = {
	q = { ":q<cr>", "Quit" },
	f = { ":Telescope find_files<cr>", "find files" },
	b = { ":Telescope buffers<cr>", "Buffers" },
	g = { ":Telescope live_grep<cr>", "Grep" },
	w = { ":w<cr>", "Save" },
	lf = { ":lua vim.lsp.buf.format { async = true }<cr>", "Format" },
}
local opts = {
	prefix = "<leader>",
}

which_key.register(mappings, opts)
