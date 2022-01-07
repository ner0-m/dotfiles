-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Nicer search
    use {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require "neva.plugins.hlslens"
        end,
    }

    -- TODO: just try it  for now
    use {
        "TimUntersberger/neogit",
        requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
        cmd = "Neogit",
        config = function()
            require "neva.plugins.neogit"
        end,
    }

    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require "neva.plugins.gitsigns"
        end,
    }

    -- TODO: This has to be configured maybe? Maybe use it?
    -- use {
    --     "kevinhwang91/nvim-bqf",
    -- }

    use {
        "sedm0784/vim-you-autocorrect",
        cmd = { "EnableAutocorrect", "DisableAutocorrect" },
    }

    use {
        -- "vhyrro/neorg",
        "~/src/nvim_plugins/neorg",
        -- ft = "norg",
        config = function()
            require "neva.plugins.neorg"
        end,
        branch = "unstable",
        requires = {"nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    }

    use {
        "RRethy/vim-illuminate",
        event = "BufEnter",
    }

    use {
        "numToStr/Comment.nvim",
        config = function()
            require "neva.plugins.comment"
        end,
        event = "BufEnter",
    }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require "neva.plugins.todo"
        end,
    }

    -- TODO: Maybe replace with mini.nvim
    use {
        "blackCauldron7/surround.nvim",
        config = function()
            require "neva.plugins.surround"
        end,
        event = "BufEnter",
    }

    use {
        "wellle/targets.vim",
        event = "BufEnter",
    }

    use {
        "ggandor/lightspeed.nvim",
        keys = { "s", "S", "f", "F", "t", "T" },
        config = function()
            require "neva.plugins.lightspeed"
        end,
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require "neva.plugins.treesitter"
        end,
    }

    use {
        "nvim-treesitter/playground",
        after = "nvim-treesitter",
    }

    use "folke/tokyonight.nvim"

    use {
        "karb94/neoscroll.nvim",
        config = function()
            require "neva.plugins.neoscroll"
        end,
        event = "BufEnter",
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                buftype_exclude = { "terminal" },
            }
        end,
    }

    use {
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require "neva.plugins.gps"
        end,
        after = "nvim-treesitter",
    }

    use {
        "famiu/feline.nvim",
        after = { "nvim-gps", "tokyonight.nvim" },
        requires = {
            { "kyazdani42/nvim-web-devicons" },
        },
        config = function()
            require "neva.statusline"
        end,
    }

    use {
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require "neva.plugins.tabline"
        end,
    }

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
        },
        config = function()
            require "neva.plugins.telescope"
        end,
    }

    -- use {
    --     "ThePrimeagen/git-worktree.nvim",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     config = function()
    --         require "neva.git-worktree"
    --     end,
    -- }

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require "neva.plugins.luasnip"
        end,
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        -- "lukas-reineke/format.nvim",
        config = function()
            require "neva.plugins.format"
        end,
        requires = "nvim-lua/plenary.nvim",
        event = "BufEnter",
    }

    use {
        "neovim/nvim-lspconfig",
        requires = {
            "ray-x/lsp_signature.nvim",
        },
        config = function()
            require "neva.lsp"
        end,
    }

    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require "neva.plugins.nvim-cmp"
        end,
    }

    use {
        "hrsh7th/cmp-buffer",
        requires = {
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "f3fora/cmp-spell",
            "onsails/lspkind-nvim",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require "neva.plugins.nvim-cmp"
        end,
        after = "nvim-cmp",
    }

    use {
        "~/src/nvim_plugins/cmp-git",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("cmp_git").setup {}
        end,
        after = "nvim-cmp",
    }

    use {
        "tweekmonster/startuptime.vim",
    }

    use {
        "danymat/neogen",
    }
end)
