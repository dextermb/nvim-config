-- local function focus()
--   local current_win = vim.api.nvim_get_current_win()
--
--   for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
--     local buf = vim.api.nvim_win_get_buf(win)
--
--     if vim.bo[buf].filetype == "neo-tree" then
--       if win ~= current_win then
--         vim.api.nvim_set_current_win(win)
--
--         return
--       end
--
--       break
--     end
--   end
-- end

local function open(opts)
  opts = opts or {}

  require("neo-tree.command").execute({
    source = opts.source or "last",
    position = opts.position or "left",
    toggle = vim.bo.filetype == "neo-tree",
  })
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
      require("neo-tree.command").execute({
        source = "filesystem",
        position = "left",
        action = "show",
      })
    end,
    keys = {
      {
        "<leader>\\",
        function()
          open()
        end,
        desc = "Neotree: Focus or toggle"
      },
      {
        "<leader>nf",
        function()
          open({ source = "filesystem" })
        end,
        desc = "Neotree: Focus or toggle Filesystem"
      },
      {
        "<leader>nb",
        function()
          open({ source = "buffers" })
        end,
        desc = "Neotree: Focus or toggle Buffer"
      },
      {
        "<leader>ng",
        function()
          open({ source = "git_status" })
        end,
        desc = "Neotree: Focus or toggle Git Status"
      }
    },
    lazy = false
  }
}
