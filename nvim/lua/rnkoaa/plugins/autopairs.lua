local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
	print("nvim-autopairs not found")
	return
end

autopairs.setup()
