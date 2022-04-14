local M = {}

CONFIG = {}

function M.setup()
	local nls = require("null-ls")
	local sources = {
		nls.builtins.formatting.prettierd.with({
			filetypes = { "html", "javascript", "json", "typescript", "yaml", "markdown" },
		}),
		nls.builtins.formatting.eslint_d,
		nls.builtins.diagnostics.shellcheck,
		nls.builtins.formatting.stylua,
		-- nls.builtins.formatting.black,
		-- nls.builtins.diagnostics.flake8,
		nls.builtins.code_actions.gitsigns,
		nls.builtins.formatting.prettier,
		nls.builtins.diagnostics.markdownlint,
		-- nls.builtins.diagnostics.vale,
	}
	nls.setup({
		sources = sources,
		-- on_attach = lsputils.lsp_attach,
		-- on_exit = lsputils.lsp_exit,
		-- on_init = lsputils.lsp_init,
		-- capabilities = lsputils.get_capabilities(),
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
			end
		end,
		flags = { debounce_text_changes = 150 },
	})
end

return M
