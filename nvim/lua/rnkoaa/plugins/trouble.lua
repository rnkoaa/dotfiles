-- https://github.com/zhongjis/dotfiles-awesome/blob/master/nvim/lua/zhongjis/lsp/trouble.lua
--
local trouble_status, trouble = pcall(require, "trouble")
if not trouble_status then
	print("trouble extension not loaded")
	return
end

trouble.setup({})
