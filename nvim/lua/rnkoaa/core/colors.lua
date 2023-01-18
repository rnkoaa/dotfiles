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

local status, nightfox = pcall(require, "nightfox")

if not status then
	print("colorscheme nightfox not found")
	return
end

nightfox.load("nordfox")

-- set background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
