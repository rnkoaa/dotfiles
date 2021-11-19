local utils = require('utils')
local saga = require 'lspsaga'

saga.init_lsp_saga()

-- code action
local opts = {noremap = true, silent = true}
utils.map('n', '<leader>ca', [[<cmd>lua require('lspsaga.codeaction').code_action()<cr>]], opts )
utils.map('v', '<leader>ca', [[<cmd>lua require('lspsaga.codeaction').range_code_action()<cr>]], opts)
utils.map('n', '<leader>gk', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>]], opts)
utils.map('n', '<leader>gs', [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>]], opts)
utils.map('n', '<leader>gr', [[<cmd>lua require('lspsaga.rename').rename()<cr>]], opts)

utils.map('n', '<leader>gr', [[<cmd>lua require('lspsaga.provider').preview_definition()<cr>]], opts)

