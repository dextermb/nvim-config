vim.o.background = "dark"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.clipboard = "unnamedplus"

vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", lead = "·", trail = "·" }

require("config.lazy")
require("config.autocmds")
require("config.keymaps")
require("config.lsp")

vim.cmd([[colorscheme gruvbox]])

