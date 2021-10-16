local gps = require "nvim-gps"
local vi_mode_utils = require "feline.providers.vi_mode"

local colors = require("tokyonight.colors").setup { style = "night" }

-- Set vi mode colors similar to lualine tokyonight
local vi_mode_colors = {
    ["NORMAL"] = colors.blue,
    ["OP"] = colors.blue,
    ["INSERT"] = colors.green,

    -- Visual modes
    ["VISUAL"] = colors.magenta,
    ["LINES"] = colors.magenta,
    ["BLOCK"] = colors.magente,

    -- Replace modes
    ["REPLACE"] = colors.red,
    ["V-REPLACE"] = colors.red,

    -- Not sure about these
    ["ENTER"] = colors.cyan,
    ["MORE"] = colors.cyan,
    ["SELECT"] = colors.orange,
    ["COMMAND"] = colors.yellow,
    ["SHELL"] = colors.green,
    ["TERM"] = colors.green,
    ["NONE"] = colors.yellow,
}

-- Some highlights, used multiple times
local default_hl = {
    fg = colors.blue,
    bg = colors.bg,
}

local emphasized_hl = {
    fg = colors.blue,
    bg = colors.fg_gutter,
    style = "bold",
}

local emphasized_whitespace = {
    str = " ",
    hl = emphasized_hl,
}

local highlight_left_sep = {
    " ",
    "slant_left_2",
    emphasized_whitespace,
}

local highlight_right_set = {
    emphasized_whitespace,
    "slant_right_2",
    -- " ",
}

-- All components used in the statusline use
local comps = {
    -- A nice left border
    left_border = {
        provider = "▊ ",
        hl = default_hl,
    },
    -- Vi mode icon
    vi_mode = {
        provider = "vi_mode",
        hl = function()
            return {
                name = vi_mode_utils.get_mode_highlight_name(),
                fg = vi_mode_utils.get_mode_color(),
                bg = colors.bg,
                style = "bold",
            }
        end,
        right_sep = " ",
    },
    file = {
        -- File name
        info = {
            provider = "file_info",
            hl = emphasized_hl,
            left_sep = highlight_left_sep,
            right_sep = highlight_right_set,
        },
        -- Position in file
        position = {
            provider = "position",
            left_sep = " ",
            right_sep = {
                " ",
                {
                    str = "slant_right_2_thin",
                    hl = default_hl,
                },
            },
        },
        -- Type of file
        type = {
            provider = "file_type",
            hl = emphasized_hl,
            left_sep = highlight_left_sep,
            right_sep = highlight_right_set,
        },
    },
    -- Diagnostics
    diagnos = {
        err = {
            provider = "diagnostic_errors",
            hl = { fg = colors.error },
        },
        warn = {
            provider = "diagnostic_warnings",
            hl = { fg = colors.warning },
        },
        hint = {
            provider = "diagnostic_hints",
            hl = { fg = colors.hint },
        },
        info = {
            provider = "diagnostic_info",
            hl = { fg = colors.info },
        },
    },
    git = {
        branch = {
            provider = "git_branch",
            hl = emphasized_hl,
            left_sep = highlight_left_sep,
            right_sep = highlight_right_set,
        },
        added = {
            provider = "git_diff_added",
            hl = {
                fg = colors.git.add,
                bg = colors.bg,
            },
        },
        changed = {
            provider = "git_diff_changed",
            hl = {
                fg = colors.git.change,
                bg = colors.bg,
            },
        },
        removed = {
            provider = "git_diff_removed",
            hl = {
                fg = colors.git.delete,
                bg = colors.bg,
            },
        },
    },
    -- Percentage of line in buffer
    line_percentage = {
        provider = "line_percentage",
        hl = default_hl,
        left_sep = " ",
        right_sep = " ",
    },
    -- A nice scroll bar
    scroll_bar = {
        provider = "scroll_bar",
        hl = emphasized_hl,
    },

    -- info about location using treesitter
    treesitter = {
        gps = {
            provider = function()
                return gps.get_location()
            end,
            left_sep = {
                " ",
                {
                    str = "slant_right_2_thin",
                    hl = default_hl,
                },
                " ",
            },
            hl = default_hl,
            enabled = function()
                return gps.is_available()
            end,
        },
    },
}

local components = {
    active = {},
    inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.left_border)
table.insert(components.active[1], comps.vi_mode)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.position)
table.insert(components.active[1], comps.diagnos.err)
table.insert(components.active[1], comps.diagnos.warn)
table.insert(components.active[1], comps.diagnos.hint)
table.insert(components.active[1], comps.diagnos.info)
table.insert(components.active[1], comps.treesitter.gps)
table.insert(components.active[2], comps.git.added)
table.insert(components.active[2], comps.git.changed)
table.insert(components.active[2], comps.git.removed)
table.insert(components.active[2], comps.git.branch)
table.insert(components.active[2], comps.line_percentage)
table.insert(components.active[2], comps.scroll_bar)

table.insert(components.inactive[1], comps.file.type)
table.insert(components.inactive[1], {})

require("feline").setup {
    components = components,
    vi_mode_colors = vi_mode_colors,
}

--[[ require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
}) ]]
