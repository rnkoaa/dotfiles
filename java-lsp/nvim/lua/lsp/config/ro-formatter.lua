-- Formatters
vim.cmd([[nnoremap <silent> <leader>f :Format<CR>]])
local home = os.getenv("HOME")
require("formatter").setup(
  {
    filetype = {
      typescript = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      gradle = {
        function()
          return {
            exe = "gradle",
            -- Formatter uses '-' as stdin
            args = {
              "--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
              "-jar",
              home .. "/.config/formatters/google-java-format-1.11.0-all-deps.jar",
              "--aosp", -- 4 spaces
              vim.api.nvim_buf_get_name(0)
            },
            -- "-" },
            stdin = true
          }
        end
      },
      groovy = {
        function()
          return {
            exe = "groovy",
            -- Formatter uses '-' as stdin
            args = {
              "--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
              "-jar",
              home .. "/.config/formatters/google-java-format-1.11.0-all-deps.jar",
              "--aosp", -- 4 spaces
              vim.api.nvim_buf_get_name(0)
            },
            -- "-" },
            stdin = true
          }
        end
      },
      typescriptreact = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      java = {
        function()
          return {
            exe = "java",
            -- Formatter uses '-' as stdin
            args = {
              "--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
              "-jar",
              home .. "/.config/formatters/google-java-format-1.11.0-all-deps.jar",
              "--aosp", -- 4 spaces
              vim.api.nvim_buf_get_name(0)
            },
            -- "-" },
            stdin = true
          }
        end
      },
      javascript = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      javascriptreact = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      json = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)
