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
