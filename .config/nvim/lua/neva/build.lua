local opts = { noremap = true }

local function map(keybind, command)
	require("neva.utils").nmap(keybind, command, opts)
end

-- Put testing current file on stronges finger!
map("<leader>xj", "<cmd>lua require('neva.elsa.build').test_current_file()<cr>")
map("<leader>xk", "<cmd>lua require('neva.elsa.build').test()<cr>")

-- Build with clang explicitly
map("<leader>xcj", "<cmd>lua require('neva.elsa.build').test_current_file({ build_options = { CXX = 'clang++' }})<cr>")

-- Build with gcc explicitly
map("<leader>xgj", "<cmd>lua require('neva.elsa.build').test_current_file({ build_options = { CXX = 'g++' }})<cr>")
