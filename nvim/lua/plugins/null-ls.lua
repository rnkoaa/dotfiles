-- setup null ls
local on_attach = function(client, bufnr)
	-- Enable formatting on sync
	if client.supports_method("textDocument/formatting") then
		local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = format_on_save,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(_client)
						return _client.name == "null-ls"
					end,
				})
			end,
		})
	end
end

local M = {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function(_, opts)
		local nls = require("null-ls")

		local sources = {
			nls.builtins.formatting.prettierd.with({
				filetypes = { "html", "javascript", "json", "typescript", "yaml", "markdown" },
			}),

			nls.builtins.formatting.eslint_d,
			nls.builtins.diagnostics.shellcheck,
			nls.builtins.formatting.stylua,
			nls.builtins.formatting.sqlfluff,
			-- nls.builtins.code_actions.gitsigns,
			nls.builtins.formatting.prettier,
			nls.builtins.diagnostics.markdownlint,
			-- nls.builtins.diagnostics.vale,
		}

		opts.sources = sources
		opts.flags = { debounce_text_changes = 150 }

		-- configure format on save
		opts.on_attach = function(current_client, bufnr)
			if current_client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client)
								--  only use null-ls for formatting instead of lsp server
								return client.name == "null-ls"
							end,
							bufnr = bufnr,
						})
					end,
				})
			end
		end
		--
		--   return {
		--     sources = sources,
		-- flags = { debounce_text_changes = 150 },
		--
		return opts
	end,
}
--[[
local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  -- dependencies = { "mason.nvim" },
  opts = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion

    return {
      sources = {
        formatting.stylua,
        formatting.prettier,
        formatting.eslint,
        formatting.fish_indent,
        -- diagnostics.eslint,
        diagnostics.fish,
        -- diagnostics.tsc,
        -- code_actions.eslint,
        code_actions.gitsigns,
        completion.spell
      },
    }
  end,
}
--]]

return M

--[[
local M = {}

local lsp = require('lsp')
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
		nls.builtins.formatting.sqlfluff,
		-- nls.builtins.code_actions.gitsigns,
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
		flags = { debounce_text_changes = 150 },
	})
end

return M
--]]
