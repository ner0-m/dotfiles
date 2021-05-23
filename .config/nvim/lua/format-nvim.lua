clangformat = function(file)
    return string.format("clang-format-10 -i -style=file %s", file)
end

require"format".setup {
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },
    cmake = {{cmd = {"cmake-format -i"}}},
    vim = {{cmd = {"lua-format -i --column-limit=120"}, start_pattern = "^lua << EOF$", end_pattern = "^EOF$"}},
    lua = {
        {
            cmd = {
                function(file)
                    return string.format("lua-format --align-paramter --chop-down-parameter --column-limit %s -i %s",
                                         120, file)
                end
            }
        }
    },
    python = {{cmd = {"yapf -i"}}}, 
    cpp = {{cmd = {clangformat}}},
    cuda = {{cmd = {clangformat}}}
}
