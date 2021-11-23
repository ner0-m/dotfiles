local luasnip = require "luasnip"

local snippets = {}

local s = luasnip.snippet

local sn = luasnip.snippet_node
local c = luasnip.choice_node
local f = luasnip.function_node
local i = luasnip.insert_node
local t = luasnip.text_node
local d = luasnip.dynamic_node

local make = function(tbl)
    local result = {}
    for k, v in pairs(tbl) do
        local snip = s({ trig = k, name = v.name, dscr = v.desc, regTrig = v.regTrig }, v.snippet or v)
        table.insert(result, snip)
    end

    return result
end
local function single_wrap(name)
    return {
        t { "\\" .. name .. "{" },
        i(1),
        t { "}" },
        i(0),
    }
end

local subscript = function(pos)
    pos = pos or 1
    return t { "_{" }, i(pos, "subscript"), t { "}" }
end

local supscript = function(pos)
    pos = pos or 1
    return t { "_{" }, i(pos, "supscript"), t { "}" }
end

local opt_subscript = function(pos)
    return c(pos, {
        t "",
        sn(nil, { subscript(1) }),
    })
end

local opt_superscript = function(pos)
    return c(pos, {
        t "",
        sn(nil, { supscript(1) }),
    })
end

local function special_begin(env)
    return {
        t { "\\begin{" .. env .. "}" },
        c(1, {
            -- Order is important, sn(...) first would cause infinite loop of expansion.
            t "",
            sn(nil, { t { "[" }, i(1, env .. " heading"), t { "]" } }),
        }),
        t { "", "\t" },
        i(2),
        t { "", "\\end{" .. env .. "}" },
        i(0),
    }
end

snippets.all = make {
    ["iff"] = {
        snippet = {
            t { "if and only if" },
        },
        name = "If and only iff abbr",
    },
}

-- snippets.all = make {
-- }

snippets.tex = make {
    mathbb = {
        snippet = single_wrap "mathbb",
        name = "mathbb",
        desc = { "## Blackboard bold", "", "Usually used for set such a the set of real or complex numbers" },
    },

    bm = {
        snippet = single_wrap "bm",
        name = "Bold math",
        desc = { "## Access bold symbols in maths mode", "", "Note: Requires \\usepackage{bm} to work" },
    },

    ["vs(%a)"] = {
        snippet = f(function(_, snip)
            return "\\bm{" .. string.upper(snip.captures[1]) .. "}"
        end, {}),
        name = "Single charachter vector spaces",
        regTrig = true,
    },

    ["vsm(%a)"] = {
        snippet = f(function(_, snip)
            return "$\\bm{" .. string.upper(snip.captures[1]) .. "}$"
        end, {}),
        name = "Single charachter vector spaces with math surrounding",
        regTrig = true,
    },

    ["mbb(%a)"] = {
        snippet = f(function(_, snip)
            return "\\mathbb{" .. string.upper(snip.captures[1]) .. "}"
        end, {}),
        name = "Blackboard bold for single charachters",
        regTrig = true,
    },

    ["%u"] = {
        snippet = {
            c(1, {
                sn(nil, {
                    t { "\\bm{" },
                    f(function(_, snip)
                        return snip.snippet.trigger
                    end, {}),
                    t { "}" },
                    i(1),
                }),
                sn(nil, {
                    t { "\\mathbb{" },
                    f(function(_, snip)
                        return snip.snippet.trigger
                    end, {}),
                    t { "}" },
                    i(1),
                }),
                sn(nil, {
                    t { "\\mathcal{" },
                    f(function(_, snip)
                        return snip.snippet.trigger
                    end, {}),
                    t { "}" },
                    i(1),
                }),
            }),
            i(0),
        },
        name = "Typical single letter math enviorments",
        regTrig = true,
    },

    norm = {
        snippet = {
            t { "\\norm{" },
            i(1),
            t { "}" },
            opt_subscript(2),
            opt_superscript(3),
            i(0),
        },
        name = "norm",
    },

    normp = {
        snippet = {
            t { "\\norm{" },
            i(1),
            t { "}_p" },
            i(0),
        },
        name = "norm",
    },

    normq = {
        snippet = {
            t { "\\norm{" },
            i(1),
            t { "}_q" },
            i(0),
        },
        name = "norm",
    },

    norminf = {
        snippet = {
            t { "\\norm{" },
            i(1),
            t { "}_{\\infty}" },
            i(0),
        },
        name = "norm",
    },
    innerproduct_dots = {
        snippet = {
            t { "\\langle \\cdot, \\cdot \\rangle" },
            i(0),
        },
        name = "Snippet for inner product with cdots in the middle",
    },

    innerproduct = {
        snippet = {
            t { "\\langle " },
            i(1),
            t { ", " },
            i(2),
            t { "\\rangle" },
            i(0),
        },
        name = "Snippet for inner product",
    },

    seqxj = {
        snippet = {
            t { "(x_{j})_{j \\in \\mathbb{N}}" },
            i(0),
        },
        name = "Sequence of x_j for j in natural numbers",
    },

    seqxn = {
        snippet = {
            t { "(x_{n})_{n \\in \\mathbb{N}}" },
            i(0),
        },
        name = "Sequence of x_n for n in natural numbers",
    },

    seqn = {
        snippet = {
            t { "(" },
            i(1),
            t { "_{n})_{n \\in \\mathbb{N}}" },
            i(0),
        },
        name = "Sequence for n in natural numbers",
    },

    eq = {
        snippet = {
            t { "\\[ " },
            i(1),
            t { " \\] " },
            i(0),
        },
        name = "Math equation enviorment",
    },

    set = {
        snippet = {
            t { "\\{ " },
            i(1),
            t { " \\} " },
            i(0),
        },
        name = "Set enviorment",
    },

    ["$"] = {
        snippet = {
            t { "$" },
            i(1),
            t { "$" },
            i(0),
        },
        name = "inline math",
    },

    ["!="] = {
        snippet = {
            t { "\\neq" },
            i(0),
        },
        name = "Not equal to",
    },

    [":="] = {
        snippet = {
            t { "\\coloneqq" },
            i(0),
        },
        name = "Defined as",
    },

    ["<="] = {
        snippet = {
            t { "\\leq" },
            i(0),
        },
        name = "Less than or equal to",
    },

    [">="] = {
        snippet = {
            t { "\\geq" },
            i(0),
        },
        name = "Greater than or equal to",
    },

    ellp = {
        snippet = {
            t { "\\ell^p" },
            i(0),
        },
        name = "\\ell^p space",
    },

    Ellp = {
        snippet = {
            t { "\\Ell^p" },
            i(0),
        },
        name = "\\Ell^p space",
    },

    pair = {
        snippet = {
            t { "(" },
            i(1),
            t { ", " },
            i(2),
            t { ")" },
            i(0),
        },
        name = "Pair of tings in parenthesis",
    },

    vspair = {
        snippet = {
            t { "(\\bm{X}, " },
            i(1),
            t { ")" },
            i(0),
        },
        name = "Pair of vector space and something else",
    },

    vspair_ell = {
        snippet = {
            t { "(\\ell^p, \\norm{\\cdot}_p)" },
            i(0),
        },
        name = "Pair of \\ell^p space and p-norm",
    },

    vspair_Ell = {
        snippet = {
            t { "(\\Ell^p, \\norm{\\cdot}_p)" },
            i(0),
        },
        name = "Pair of \\Ell^p space and p-norm",
    },

    def = special_begin "definition",
    lem = special_begin "lemma",
    theo = special_begin "theorem",
    coro = special_begin "corollary",

    sum_ntoinf = {
        snippet = {
            t { "\\sum_{n=1}^{\\infty}" },
            i(0),
        },
        name = "Sum of n to plus infinity",
    },

    sum_jton = {
        snippet = {
            t { "\\sum_{j=1}^{n}" },
            i(0),
        },
        name = "Sum of j to n",
    },
    frac = {
        snippet = {
            t { "\\frac{" },
            i(1),
            t { "}{" },
            i(2),
            t { "}" },
            i(0),
        },
    },
    oneover = {
        snippet = {
            t { "\\frac{1}{" },
            i(1),
            t { "}" },
            i(0),
        },
        name = "One over",
    },

    inf = {
        snippets = {
            t { "\\infty" },
            i(0),
        },
        name = "Infinity",
    },

    ["."] = {
        snippet = {
            t { "\\cdot" },
            i(0),
        },
        name = "Single middle dot as placeholder in math enviorments",
    },

    ["..."] = {
        snippet = {
            t { "\\dots" },
            i(0),
        },
        name = "Tripple dots",
    },

    ["L("] = {
        snippet = {
            t { "L(" },
            i(1),
            t { ", " },
            i(2),
            t { ")" },
            i(0),
        },
        name = "Tripple dots",
    },

    ["_"] = {
        snippet = {
            t { "_{" },
            i(1, "subscript"),
            t { "}" },
            i(0),
        },
        name = "Subscript",
    },

    ["^"] = {
        snippet = {
            t { "^{" },
            i(1, "supscript"),
            t { "}" },
            i(0),
        },
        name = "Supscript",
    },

    sup = {
        snippet = {
            t { "\\sup" },
            opt_subscript(1),
            i(0),
        },
        name = "Supremum",
    },

    lim = {
        snippet = {
            t { "\\lim" },
            opt_subscript(1),
            i(0),
        },
        name = "Limes",
    },

    --[[
    snippets for:
    * forall x in X
    * lim
    * inverse of operator
    * item[i)]

    --]]
}

return snippets
