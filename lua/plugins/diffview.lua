return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-mini/mini.icons"
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Git Diff: Open" },
      { "<leader>gc", "<cmd>tabclose<CR>", desc = "Git Diff: Close" },
      {
        "<leader>gh",
        function()
          local file = vim.fn.expand("%:p")
          if file == "" then
            vim.notify("No file in current buffer", vim.log.levels.WARN)
            return
          end
          vim.cmd("DiffviewFileHistory " .. vim.fn.fnameescape(file))
        end,
        desc = "Git Diff: Open History",
      },
    }
  }
}
