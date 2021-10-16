local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	sources = {
		{ name = "nvim_lsp", priority = 10 },
		{ name = "nvim_lua", priority = 10 },
		{ name = "spell", priority = 3, keyword_length = 5 },
		{ name = "treesitter", priority = 3 },
		{ name = "buffer", priority = 2, keyword_length = 5 },
		{ name = "path", priority = 2, keyword_length = 5 },
		{ name = "latex_symbols", priority = 2 },
		{ name = "luasnip", priority = 1 },
		{ name = "calc", priority = 1 },
	},
	formatting = {
		format = require("lspkind").cmp_format({
			with_text = true,
			maxwidth = 80,
		}),
	},
	sorting = {
		-- Taken from https://github.com/hrsh7th/nvim-cmp/issues/277
		comparators = {
			-- function(entry1, entry2)
			-- 	local score1 = entry1.completion_item.score
			-- 	local score2 = entry2.completion_item.score
			-- 	if score1 and score2 then
			-- 		local diff = score1 - score2
			-- 		if diff < 0 then
			-- 			return true
			-- 		elseif diff > 0 then
			-- 			return false
			-- 		end
			-- 	end
			-- end,

			-- The built-in comparators:
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})
