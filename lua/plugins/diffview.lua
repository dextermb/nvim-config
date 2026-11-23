return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-mini/mini.icons"
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Git Diff: Open" },
      { "<leader>gD", "<cmd>DiffviewClose<CR>", desc = "Git Diff: Close" }
    }
  }
}
