-- local utils = require("utils")
-- local saga = require("lspsaga")
local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status then
	print("lspsaga not found")
	return
end

-- local action = require("lspsaga.codeaction")
local lspsaga_action_status, lspsaga_action = pcall(require, "lspsaga.codeaction")
if not lspsaga_action_status then
	print("lspsaga CodeAction not found")
	return
end

-- -- use custom config
lspsaga.init_lsp_saga({
	-- server_filetype_map = {
	-- 	typescript = "typescript",
	-- },
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	finder_action_keys = {
		open = "<CR>",
	},
	definition_action_keys = {
		edit = "<CR>",
	},
	-- put modified options in there
})

-- -- code action
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<leader>ca", [[<cmd>lua require('lspsaga.codeaction').code_action()<cr>]], opts)
-- vim.keymap.set("v", "<leader>ca", [[<cmd>lua require('lspsaga.codeaction').range_code_action()<cr>]], opts)
-- vim.keymap.set("n", "<leader>gk", [[<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>]], opts)
-- vim.keymap.set("n", "<leader>gs", [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>]], opts)
-- vim.keymap.set("n", "<leader>gr", [[<cmd>lua require('lspsaga.rename').rename()<cr>]], opts)

-- vim.keymap.set("n", "<leader>ca", lspsaga_action.range_code_action(), opts)
-- vim.keymap.set("v", "<leader>ca", [[<cmd>lua require('lspsaga.codeaction').range_code_action()<cr>]], opts)
-- vim.keymap.set("n", "<leader>gk", [[<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>]], opts)
-- vim.keymap.set("n", "<leader>gs", [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>]], opts)
-- vim.keymap.set("n", "<leader>gr", [[<cmd>lua require('lspsaga.rename').rename()<cr>]], opts)

-- utils.map('n', '<leader>gr', [[<cmd>lua require('lspsaga.provider').preview_definition()<cr>]], opts)
-- vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true })
-- vim.keymap.set("v", "<leader>ca", function()
-- 	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
-- 	action.range_code_action()
-- end, { silent = true })
-- or use command
-- vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
