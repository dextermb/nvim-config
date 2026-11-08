vim.keymap.set("n", "<leader>%", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>\"", "<cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>o", "<cmd>wincmd w<CR>", { desc = "Go to next window" })
vim.keymap.set("n", "<leader>;", "<cmd>wincmd W<CR>", { desc = "Go to prev window" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.keymap.set({"n", "x"}, "<leader>j", 'J', { desc = 'Join lines' })
vim.keymap.set("n", "<leader>J", "i<CR><Esc>==", { desc = "Split line at cursor" })
