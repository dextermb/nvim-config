vim.o.background = "dark"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>%", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>\"", "<cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>o", "<cmd>wincmd w<CR>", { desc = "Go to next window" })
vim.keymap.set("n", "<leader>;", "<cmd>wincmd W<CR>", { desc = "Go to prev window" })

require("config.lazy")

vim.cmd([[colorscheme gruvbox]])
