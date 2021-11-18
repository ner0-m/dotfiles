local luasnip = require "luasnip"

local snippets = {}

local snippet = luasnip.s

local c = luasnip.c -- choice node
local f = luasnip.f -- function node
local i = luasnip.i -- insert node
local t = luasnip.t -- text node
local d = luasnip.d -- dynamic node

local make = function(tbl)
    local result = {}
    for k, v in pairs(tbl) do
        table.insert(result, (snippet({ trig = k, name = v.name, dscr = v.desc }, v.snippet or v)))
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

local function special_begin(env)
    return {
        t { "\\begin{" .. env .. "}", "\t" },
        i(1),
        t { "", "\\end{" .. env .. "}" },
        i(0),
    }
end

snippets.all = make {
    iff = {
        snippet = {
            t { "if and only if" },
        },
        name = "If and only iff abbr",
    },
}

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
    vsx = {
        snippet = {
            t { "\\bm{X}" },
            i(0)
       },
        name = "Vector space X",
    },
    vsxm = {
        snippet = {
            t { "$\\bm{X}$" },
            i(0)
        },
        name = "Vector space X (including math eviorment)",
    },
    N = {
        snippet = {
            t { "\\mathbb{N}" },
            i(0)
        },
        name = "Space of natural numbers",
    },
    C = {
        snippet = {
            t { "\\mathbb{C}" },
            i(0)
        },
        name = "Space of complex numbers",
    },
    R = {
        snippet = {
            t { "\\mathbb{R}" },
            i(0)
        },
        name = "Space of real numbers",
    },
    K = {
        snippet = {
            t { "\\mathbb{K}" },
            i(0)
        },
        name = "Field K",
    },

    norm = {
        snippet = single_wrap "norm",
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
            t { "\\langle\\cdot,\\cdot\\rangle" },
            i(0),
        },
        name = "Snippet for inner product with cdots in the middle",
    },
    innerproduct = {
        snippet = {
            t { "\\langle" },
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

    sum_hton = {
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
}

return snippets
