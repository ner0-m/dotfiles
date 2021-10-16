require("kommentary.config").use_extended_mappings()
 
require("kommentary.config").configure_language("cpp", {
    single_line_comment_string = "//",
    prefer_single_line_comments = true,
})
 
require("kommentary.config").configure_language("lua", {
    prefer_single_line_comments = true,
})
