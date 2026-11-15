return {
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.g.gitgutter_map_keys = 0
      vim.g.gitgutter_sign_added = "+"
      vim.g.gitgutter_sign_modified = "~"
      vim.g.gitgutter_sign_removed = "-"
      vim.g.gitgutter_sign_modified_removed = "~-"
    end,
    keys = {
      { "<leader>hs", "<cmd>GitGutterStageHunk<CR>", desc = "Stage hunk" },
      { "<leader>hu", "<cmd>GitGutterUndoHunk<CR>", desc = "Undo hunk" },
      { "<leader>hp", "<cmd>GitGutterPreviewHunk<CR>", desc = "Preview hunk" },
      { "]c", "<cmd>GitGutterNextHunk<CR>", desc = "Next hunk" },
      { "[c", "<cmd>GitGutterPrevHunk<CR>", desc = "Previous hunk" },
      { "<leader>gg", "<cmd>GitGutterToggle<CR>", desc = "Toggle GitGutter" },
    },
  }
}
