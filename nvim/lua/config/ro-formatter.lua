local home = os.getenv("HOME")
require("formatter").setup({
	logging = false,
	filetype = {
		javascript = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		-- rust = {
		-- 	-- Rustfmt
		-- 	function()
		-- 		return {
		-- 			exe = "rustfmt",
		-- 			args = { "--edition=2018", "--emit=stdout" },
		-- 			stdin = true,
		-- 		}
		-- 	end,
		-- },
		-- go = {
		-- 	function()
		-- 		return {
		-- 			exe = "gofmt",
		-- 			args = { vim.api.nvim_buf_get_name(0) },
		-- 			stdin = true,
		-- 		}
		-- 	end,
		-- },
		-- lua = {
		-- 	function()
		-- 		return {
		-- 			exe = "stylua",
		-- 			args = { "-" },
		-- 			stdin = true,
		-- 		}
		-- 	end,
		-- },
		java = {
			function()
				return {
					exe = "java",
            		-- Formatter uses '-' as stdin
					args = {
                    "--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
                    "-jar", 
                    home .. "/.config/formatters/google-java-format-1.11.0-all-deps.jar", "-" },
					stdin = true,
				}
			end,
		},
	},
})

  -- autocmd BufWritePost *.js,*.rs,*.go,*.lua,*.java FormatWrite
-- vim.api.nvim_exec(
-- 	[[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.rs,*.go FormatWrite
-- augroup END
-- ]],
-- 	true
-- )
