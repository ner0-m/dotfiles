local job = require("plenary.job")

local M = {}

local function is_elsa(path)
	local found = path:find("elsa")
	return type(found) == "number" and found > 0
end

function M.elsa_build(path, branch, target)
	if is_elsa(path) then
		target = target or vim.fn.input("Test target: ")
		job
			:new({
				command = "tmux-windowizer",
				cwd = path,
				args = { branch, "make", "build", target },
			})
			:sync()
	end
end

function M.elsa_test(path, branch, target)
	if is_elsa(path) then
		target = target or vim.fn.input("Test target: ")
		job
			:new({
				command = "tmux-windowizer",
				cwd = path,
				args = { branch, "make", "test", target },
			})
			:sync()
	end
end

return M
