return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local icons = require("config.icons")

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, {
					"i",
					"s",
					"c",
				}),
				["<C-k>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
					"c",
				}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					local max_width = 0
					local source_names = {
						nvim_lsp = "(LSP)",
						path = "(Path)",
						luasnip = "(Snippet)",
						buffer = "(Buffer)",
					}
					local duplicates = {
						buffer = 1,
						path = 1,
						nvim_lsp = 0,
						luasnip = 1,
					}
					local duplicates_default = 0
					if max_width ~= 0 and #item.abbr > max_width then
						item.abbr = string.sub(item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
					end
					item.kind = icons.kind[item.kind]
					item.menu = source_names[entry.source.name]
					item.dup = duplicates[entry.source.name] or duplicates_default
					return item
				end,
			},
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}

--[[
return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
	},
	opts = function(_, opts)
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local icons = require("config.icons")

		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			-- formatting = {
			-- 	format = function(_, item)
			-- 		local icons = require("config.icons")
			-- 		if icons[item.kind] then
			-- 			item.kind = icons[item.kind] .. item.kind
			-- 		end
			-- 		return item
			-- 	end,
			-- },
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					local max_width = 0
					local source_names = {
						nvim_lsp = "(LSP)",
						path = "(Path)",
						luasnip = "(Snippet)",
						buffer = "(Buffer)",
					}
					local duplicates = {
						buffer = 1,
						path = 1,
						nvim_lsp = 0,
						luasnip = 1,
					}
					local duplicates_default = 0
					if max_width ~= 0 and #item.abbr > max_width then
						item.abbr = string.sub(item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
					end
					item.kind = icons.kind[item.kind]
					item.menu = source_names[entry.source.name]
					item.dup = duplicates[entry.source.name] or duplicates_default
					return item
				end,
			},
			experimental = {
				ghost_text = {
					hl_group = "LspCodeLens",
				},
			},
		}
	end,
}
--]]
