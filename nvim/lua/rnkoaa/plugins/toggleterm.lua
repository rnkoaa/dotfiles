local toggleterm_status, toggleterm = pcall(require, "toggleterm")

if not toggleterm_status then
	print("toggleterm not found")
	return
end

toggleterm.setup({
	open_mapping = [[<c-\>]],
})
