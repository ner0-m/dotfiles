local cmp = require "cmp"

local cmp_begin_double_underscore = function(entry1, entry2)
    local _, entry1_under = entry1.completion_item.label:find "__"
    local _, entry2_under = entry2.completion_item.label:find "__"

    entry1_under = entry1_under or 0
    entry2_under = entry2_under or 0

    -- entry1 has more underscores than entry2
    if entry1_under > entry2_under then
        return false
    elseif entry1_under < entry2_under then
        return true
    end
end

local cpp_cmp_detail_namespace = function(entry1, entry2)
    if entry1.context.filetype == "cpp" or entry2.context.filetype == "cpp" then
        local namespace_patterns = { "details?", "internal" }

        for _, namespace in ipairs(namespace_patterns) do
            local pattern = string.format("::%s", namespace)
            local _, entry1_under = entry1.completion_item.label:find(pattern)
            local _, entry2_under = entry2.completion_item.label:find(pattern)

            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0

            if entry1_under > entry2_under then
                return false
            elseif entry1_under < entry2_under then
                return true
            end
        end
    end
end

local cpp_cmp_allow_underscore_variable = function(entry1, entry2)
    if entry1.context.filetype == "cpp" or entry2.context.filetype == "cpp" then
        local kind1 = entry1:get_kind()
        local kind2 = entry2:get_kind()

        if kind1 == kind2 and kind1 == cmp.lsp.CompletionItemKind.Field then
            local _, entry1_under = entry1.completion_item.label:find "^%s_"
            local _, entry2_under = entry2.completion_item.label:find "^%s_"

            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0

            if entry1_under > entry2_under then
                return false
            elseif entry1_under < entry2_under then
                return true
            end
        end
    end
end

local cpp_cmp_filter_underscore = function(entry1, entry2)
    if entry1.context.filetype == "cpp" or entry2.context.filetype == "cpp" then
        local _, entry1_under = entry1.completion_item.label:find "::_+"
        local _, entry2_under = entry2.completion_item.label:find "::_+"

        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0

        if entry1_under > entry2_under then
            return false
        elseif entry1_under < entry2_under then
            return true
        end
    end
end

local luasnip = require "luasnip"

local replace_termcodes = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),

        ["<C-space>"] = cmp.mapping.complete(),

        ["<C-y>"] = cmp.mapping.confirm {
            -- behavior = cmp.ConfirmBehavior.Insert,
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },

        ["<C-j>"] = cmp.mapping(function()
            if require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(replace_termcodes "<Plug>luasnip-expand-or-jump", "")
            end
        end, {
            "i",
            "s",
        }),

        -- This works for now, but it's so ugly p.q
        -- ["<C-q>"] = cmp.mapping(function(fallback)
        --     if luasnip and luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     else
        --         fallback()
        --     end
        -- end, {
        --     "i",
        --     "c",
        -- }),

        -- ["<C-q>"] = cmp.mapping.confirm {
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = true,
        -- },
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "cmp_git" },
        { name = "luasnip" },
        { name = "spell", keyword_length = 5 },
        { name = "buffer", keyword_length = 5 },
        { name = "path", keyword_length = 5 },
    },
    formatting = {
        format = require("lspkind").cmp_format {
            with_text = true,
            maxwidth = 80,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                gh_issues = "[issues]",
                cmp_git = "[git]",
            },
        },
    },
    sorting = {
        -- Taken from https://github.com/hrsh7th/nvim-cmp/issues/277
        comparators = {
            cpp_cmp_detail_namespace,
            cpp_cmp_allow_underscore_variable,
            cpp_cmp_filter_underscore,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp_begin_double_underscore,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
}
