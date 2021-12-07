-- setup lsp clangd from https://github.com/neovim/nvim-lspconfig#clangd
local on_attach = require("neva.lsp.on_attach").on_attach_vim
local util = require("lspconfig.util")

local root_pattern_fallback = function(...)
	local root_pattern = util.root_pattern(...)
	return function(fname)
		local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
		return root_pattern(filename) or util.path.dirname(filename)
	end
end

--[[
require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed", -- find out if you prefer this or bundled
    };
    filetypes = {"c", "cpp", "objc", "objcpp", "cu", "cuh", "cuda"},
}
--]]

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Keep this around to experiment with nwer versions of clangd :^)
---[[
require("lspconfig").clangd.setup({
	on_attach = on_attach,
	cmd = {
		"/home/david/src/llvm-project/build/bin/clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--inlay-hints",
		"--cross-file-rename",
		"--log=verbose",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cu", "cuh", "cuda" },
	capabilities = capabilities,
})
--]]

-- setup lsp for CMake
require("lspconfig").cmake.setup({
	on_attach = on_attach,
	filetypes = { "cmake" },
	init_options = {
		buildDirectory = { "_build/release-clang" },
	},
	capabilities = capabilities,
})

local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
else
	print("Unsupported system for sumneko")
end

-- Setup runtime path
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
table.insert(runtime_path, "/home/david/src/awesome/lib/?.lua")

local library = {
	[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
	[vim.fn.expand("~/src/awesome/lib")] = true,
}

root_pattern = require("lspconfig").util.root_pattern

-- setup lsp for lua
require("lspconfig").sumneko_lua.setup({
	on_attach = on_attach,
	cmd = { "lua-language-server", "/usr/lib/lua-language-server/bin/Linux/main.lua", '--logpath="/home/david/log"' },
	root_dir = function(fname)
		local root_pattern = root_pattern_fallback("rc.lua", "stylua.toml", ".git")
		local root_dir = root_pattern(fname)

		if root_dir:match("awesome") then
			print("AWEESOME")
		end

		return root_dir
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
				disable = { "lowercase-global" },
			},
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			-- According to https://github.com/sumneko/lua-language-server/issues/259#issuecomment-730141987
			-- This: "workspace.library determines which directories go back to collect extra Lua files,
			-- which are used to intelligently sense and share global variables."
			workspace = {
				library = library,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	capabilities = capabilities,
})

-- setup lsp for python https://jdhao.github.io/2019/11/20/neovim_builtin_lsp_hands_on/
-- require'lspconfig'.pyls.setup {on_attach = on_attach_vim}

-- setup lsp for latex
require("lspconfig").texlab.setup({
	on_attach = on_attach,
	cmd = { "texlab", "-vvvv" },
	root_dir = root_pattern_fallback("main.tex", ".git"),
	capabilities = capabilities,
	settings = {
		texlab = {
			latex = {
				root_dir = ".",
				build = {
					executable = "make",
					onSave = true,
					outputDirectory = { "./build" },
				},
			},
			chktex = { onOpenAndSave = true, onEdit = false },
			forwardSearch = {
				executable = "zathura",
				args = { "--synctex-forward", "%l:1:%f", "%p" },
				onSave = true,
			},
			lint = {
				onChange = true,
			},
		},
	},
})

require("lspconfig").zk.setup({
	on_attach = function(client, bufnr)
		-- Key mappings
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		local opts = { noremap = true, silent = false }
		-- Follow a Markdown link with <CR>.
		buf_set_keymap("n", "<CR>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		-- Preview a note with K when the cursor is on a link.
		buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		-- Create a new note using the current visual selection for the note title. This will replace the selection with a link to the note.
		buf_set_keymap("v", "<CR>", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
		-- Reindex the notebook. Usually the language server does this automatically, so it's not often needed.
		buf_set_keymap("n", "<leader>zi", ':lua require("lspconfig")zk.index()<CR>', opts)
		-- Create a new note after prompting for a title.
		buf_set_keymap(
			"n",
			"<leader>zn",
			":lua require(\"lspconfig\").zk.new {title = vim.fn.input('Title: ')}<CR>",
			opts
		)
		-- Find the backlinks for the note linked under the cursor.
		buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	end,
})
