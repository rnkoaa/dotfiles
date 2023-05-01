-- setup null ls
local M = {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")

    local sources = {
      nls.builtins.formatting.prettierd.with({
        filetypes = { "html", "javascript", "json", "typescript", "yaml", "markdown" },
      }),

    nls.builtins.formatting.prettier,
      nls.builtins.formatting.eslint_d,
      nls.builtins.formatting.shfmt,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.sqlfluff,
      -- nls.builtins.code_actions.gitsigns,
      nls.builtins.diagnostics.shellcheck,
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
    return opts
  end,
}

return M
