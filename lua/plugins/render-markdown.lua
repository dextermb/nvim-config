local function toggle_markdown()
  local markdown = require("render-markdown")
  local buf = vim.api.nvim_get_current_buf()
  markdown.set_buf(not markdown.get(buf))
end

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "markdown",
    opts = {
      enabled = false,
    },
    keys = {
      { "<leader>Mr", toggle_markdown, desc = "Toggle Markdown for current Buffer" },
    },
  }
}
