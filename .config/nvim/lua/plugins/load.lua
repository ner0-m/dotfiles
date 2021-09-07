-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Nicer search
	use("kevinhwang91/nvim-hlslens")

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use("sedm0784/vim-you-autocorrect")

	use({
		"vhyrro/neorg",
		config = function()
			require("neorg").setup({
				-- Tell Neorg what modules to load
				load = {
					["core.defaults"] = {}, -- Load all the default modules
					["core.norg.concealer"] = {}, -- Allows for use of icons
					["core.norg.dirman"] = { -- Manage your directories with Neorg
						config = {
							workspaces = {
								my_workspace = "~/neorg",
							},
						},
					},
					["core.keybinds"] = {
						config = {
							default_keybindgs = true, -- Generate the default keybindings
							norg_leader = "<leader>", -- This is the deffault if unspecified
						},
					}, -- Configure core.keybinds
				},
			})
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	use("RRethy/vim-illuminate")

	use({
		"b3nj5m1n/kommentary",
		config = function()
			require("kommentary.config").configure_language("cpp", {
				single_line_comment_string = "//",
				prefer_single_line_comments = true,
			})
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"blackCauldron7/surround.nvim",
		config = function()
			require("surround").setup({ prefix = "c" })
		end,
	})

	use("wellle/targets.vim")

	use({
		"ggandor/lightspeed.nvim",
		config = function()
			require("lightspeed").setup({
				highlight_unique_chars = true,
			})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("nvim-treesitter/playground")

	use("folke/tokyonight.nvim")

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
			})
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				buftype_exclude = { "terminal" },
			})
		end,
	})

	use({
		"hoob3rt/lualine.nvim",
		requires = { { "kyazdani42/nvim-web-devicons", "nvim-lua/lsp-status.nvim" }, opt = true },
		config = function()
			function LspStatus()
				if #vim.lsp.buf_get_clients() < 1 then
					return ""
				end
				return require("lsp-status").status()
			end

			require("lualine").setup({
				options = {
					theme = "tokyonight",
					section_separators = { "", "" },
					component_separators = { "", "" },
					icons_enabled = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { { "branch", icon = "" } },
					lualine_c = { { "filename", file_status = true }, "LspStatus()" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "fzf" },
			})
		end,
	})

	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use("simrat39/symbols-outline.nvim")

	use("nvim-lua/popup.nvim")

	use("nvim-telescope/telescope-fzy-native.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{
				"nvim-lua/plenary.nvim",
			},
		},
	})

	use("L3MON4D3/LuaSnip")

	use("lukas-reineke/format.nvim")

	use("neovim/nvim-lspconfig")

	use("onsails/lspkind-nvim")

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"kdheepak/cmp-latex-symbols",
			"f3fora/cmp-spell",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	use("ray-x/lsp_signature.nvim")
end)
