return {
  {
    "Crysthamus/nvim-file-operations",
    dependencies = {
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("nvim-file-operations").setup()
    end,
  },
}
