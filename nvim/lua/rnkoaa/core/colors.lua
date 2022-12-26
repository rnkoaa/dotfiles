-- vim.cmd('colorscheme rose-pine')
--
local status, _ = pcall(vim.cmd, "colorscheme rose-pine")

if not status then
  print("colorscheme rose-pine not found")
  return
end
