-- vim.cmd('colorscheme rose-pine')
--
-- local status, _ = pcall(vim.cmd, "colorscheme rose-pine")
-- if not status then
-- 	print("colorscheme rose-pine not found")
-- 	return
-- end

-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not status then
-- 	print("colorscheme rose-pine not found")
-- 	return
-- end

local status, nightfox = pcall(require, "tokyonight")

if not status then
	print("colorscheme tokyonight not found")
	return
end

vim.cmd[[colorscheme tokyonight]]

-- set background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
