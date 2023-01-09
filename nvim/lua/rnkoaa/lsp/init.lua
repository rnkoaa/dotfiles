-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("gf", "<cmd>Lspsaga lsp_finder<CR>", "Show Definition") -- show definition, references
	nmap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", "[G]o to [D]eclaration") -- got to declaration
	nmap("gd", "<cmd>Lspsaga peek_definition<CR>", "[G]o to [D]efinition") -- see definition and make edits in window
	nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]o to [I]mplementation") -- go to implementation
	nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "Show [C]ode [A]ctions") -- see available code actions
	nmap("<leader>rn", "<cmd>Lspsaga rename<CR>", "[R]ename variable") -- smart rename
	nmap("<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Diagnostics") -- show  diagnostics for line
	nmap("<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show Cursor Diagnostics") -- show diagnostics for cursor
	nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump to previous Diagnostic in Buffer") -- jump to previous diagnostic in buffer
	nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Jump to next Diagnostic in Buffer") -- jump to next diagnostic in buffer
	nmap("K", "<cmd>Lspsaga hover_doc<CR>", "Hover over Cursor") -- show documentation for what is under cursor
	nmap("<leader>o", "<cmd>LSoutlineToggle<CR>", "See outline on Right") -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		nmap("<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		nmap("<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		nmap("<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end

	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.formatting_seq_sync()
			end,
		})
	end

	-- nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	-- nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	--
	-- nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	-- nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	-- nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	-- nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	-- nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	-- nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	--
	-- -- See `:help K` for why this keymap
	-- nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	-- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
	--
	-- -- Lesser used LSP functionality
	-- nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	-- nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	-- nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local M = {}
M.on_attach = on_attach

return M

-- https://alpha2phi.medium.com/neovim-for-beginners-lsp-plugins-4fc67154e3e0
-- local function on_attach(client, bufnr)
-- Enable completion triggered by <C-X><C-O>
-- See `:help omnifunc` and `:help ins-completion` for more information.
-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

-- Use LSP as the handler for formatexpr.
-- See `:help formatexpr` for more information.
-- vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

-- Configure key mappings
-- require("config.lsp.keymaps").setup(client, bufnr)

-- Configure highlighting
-- require("config.lsp.highlighter").setup(client)

-- Configure formatting
-- require("config.lsp.null-ls.formatters").setup(client, bufnr)

-- Configure for Typescript
--   if client.name == "tsserver" then
--     require("config.lsp.ts-utils").setup(client)
--   end
-- end
