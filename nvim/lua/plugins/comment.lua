return {
	"numToStr/Comment.nvim", opts = {}
}

--[[
local status, comment = pcall(require, "Comment")
if not status then
  print("Comment not loaded")
  return
end
-- Enable Comment.nvim
comment.setup()
]]--


