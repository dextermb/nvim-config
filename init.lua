local wrap_text = require("utils.wrap-text").wrap_text

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

vim.opt.list = true
vim.opt.listchars = { tab = "» ", lead = "·", trail = "·" }

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    current_line = true,
    format = function(diagnostic)
      local info = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1]
      local width = info.width - info.textoff - diagnostic.col - 6

      return wrap_text(diagnostic.message, math.max(width, 30))
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
    max_width = 80
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()

    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

vim.keymap.set("n", "<leader>%", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>\"", "<cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>o", "<cmd>wincmd w<CR>", { desc = "Go to next window" })
vim.keymap.set("n", "<leader>;", "<cmd>wincmd W<CR>", { desc = "Go to prev window" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.keymap.set({"n", "x"}, "<leader>j", 'J', { desc = 'Join lines' })
vim.keymap.set("n", "<leader>J", "i<CR><Esc>==", { desc = "Split line at cursor" })

require("config.lazy")

vim.cmd([[colorscheme gruvbox]])

