local job = require "plenary.job"

local M = {}

local conf = require("neva.elsa.config").config

local function is_elsa(path)
    local found = path:find "elsa"
    return type(found) == "number" and found > 0
end

local function to_makefile_options(opts)
    ret = {}
    for k, v in pairs(opts) do
        if type(v) == "boolean" then
            table.insert(ret, tostring(k) .. "=" .. (v and "y" or "n"))
        else
            table.insert(ret, tostring(k) .. "=" .. tostring(v))
        end
    end
    return ret
end

function basename(url)
    local name, _ = string.gsub(url, "(.*/)(.*)", "%2")
    return name
end

function get_file_extensions(url)
    return url:match "^.+(%..+)$"
end

function get_file_name_and_extension(url)
    local file = basename(url)
    local extension = get_file_extensions(file)

    if extension then
        return file:sub(1, #file - #extension), extension:sub(2, #extension)
    else
        -- If a file without extension is passed
        return file, nil
    end
end

-- Overwrite a with b
local function overwrite(a, b)
    local result = a or {}

    for k, v in pairs(b or {}) do
        result[k] = v
    end
    return result
end

-- Append b to a
local function append(a, b)
    for _, v in ipairs(b) do
        table.insert(a, tostring(v))
    end
    return a
end

local function build_args(branch, kind, target, build_opts)
    local build_opts = to_makefile_options(overwrite(conf.build_options, build_opts))

    local args = append({ branch, "make" }, build_opts)

    table.insert(args, kind)
    table.insert(args, target)

    return args
end

local function elsa_call_make(opts)
    local path = opts.path or vim.fn.getcwd()

    if is_elsa(path) then
        local kind = opts.kind
        local target = opts.target or vim.fn.input "Test target: "
        local branch = opts.branch or vim.g.gitsigns_head or "no-branch"
        local build_opts = opts.build_options or {}

        local args = build_args(branch, kind, target, build_opts)

        job
            :new({
                command = "tmux-windowizer",
                cwd = path,
                args = args,
            })
            :sync()
    end
end

function M.build(opts)
    opts["kind"] = "test"
    elsa_call_make(opts)
end

function M.test(opts)
    local opts = opts or {}
    opts["kind"] = "test"
    elsa_call_make(opts)
end

function M.test_current_file(opts)
    local opts = opts or {}

    local current_buffer = vim.fn.expand "%:p"
    local file_name, file_extension = get_file_name_and_extension(current_buffer)

    local is_test_file = string.sub(file_name, 1, string.len "test_") == "test_"
    local is_cpp_file = file_extension == "cpp"

    if is_test_file and is_cpp_file then
        opts["target"] = file_name
        M.test(opts)
    end
end

return M
