-- init.lua
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
nvimtree.setup({
	-- update_focused_file = {
	-- 	enabled = true,
	-- },
	--
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
}) -- END_DEFAULT_OPTS
