local utils = require("utils")
local saga = require("lspsaga")
local action = require("lspsaga.codeaction")

-- change the lsp symbol kind
local kind = require("lspsaga.lspkind")
kind[type_number][2] = icon -- see lua/lspsaga/lspkind.lua

-- use default config
saga.init_lsp_saga()

-- use custom config
saga.init_lsp_saga({
	-- put modified options in there
})

-- saga.init_lsp_saga()

-- -- code action
local opts = { noremap = true, silent = true }
-- utils.map('n', '<leader>ca', [[<cmd>lua require('lspsaga.codeaction').code_action()<cr>]], opts )
-- utils.map('v', '<leader>ca', [[<cmd>lua require('lspsaga.codeaction').range_code_action()<cr>]], opts)
-- utils.map('n', '<leader>gk', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>]], opts)
-- utils.map('n', '<leader>gs', [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>]], opts)
-- utils.map('n', '<leader>gr', [[<cmd>lua require('lspsaga.rename').rename()<cr>]], opts)

-- utils.map('n', '<leader>gr', [[<cmd>lua require('lspsaga.provider').preview_definition()<cr>]], opts)
vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
	action.range_code_action()
end, { silent = true })
-- or use command
-- vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
