return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    },
    config = function()
      require("neo-tree.command").execute({
        source = "filesystem",
        position = "left"
      })
    end,
    keys = {
	    {
		    "<leader>\\",
        function()
          local current_win = vim.api.nvim_get_current_win()
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "neo-tree" then
              if win ~= current_win then
                vim.api.nvim_set_current_win(win)
                return
              end
              break
            end
          end
          require("neo-tree.command").execute({
            toggle = true,
            source = "filesystem",
            position = "left"
          })
        end,
        desc = "Focus or toggle tree"
	    }
    },
    lazy = false
  }
}
