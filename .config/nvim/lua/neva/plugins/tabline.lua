local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<leader>bp", ":BufferPrevious<CR>", opts)
map("n", "<leader>bn", ":BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<leader>b<", ":BufferMovePrevious<CR>", opts)
map("n", "<leader>b>", " :BufferMoveNext<CR>", opts)

-- Goto buffer in position...
map("n", "<leader>b1", ":BufferGoto 1<CR>", opts)
map("n", "<leader>b2", ":BufferGoto 2<CR>", opts)
map("n", "<leader>b3", ":BufferGoto 3<CR>", opts)
map("n", "<leader>b4", ":BufferGoto 4<CR>", opts)
map("n", "<leader>b5", ":BufferGoto 5<CR>", opts)
map("n", "<leader>b6", ":BufferGoto 6<CR>", opts)
map("n", "<leader>b7", ":BufferGoto 7<CR>", opts)
map("n", "<leader>b8", ":BufferGoto 8<CR>", opts)
map("n", "<leader>b9", ":BufferGoto 9<CR>", opts)
map("n", "<leader>b0", ":BufferLast<CR>", opts)

-- Close buffer
map("n", "<leader>bc", ":BufferClose<CR>", opts)

-- s for select 
map("n", "<leader>bs", ":BufferPick<CR>", opts)
 
-- Sort automatically by...
map("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", ":BufferOrderByLanguage<CR>", opts)
