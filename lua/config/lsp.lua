local wrap_text = require("utils.wrap-text").wrap_text

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
