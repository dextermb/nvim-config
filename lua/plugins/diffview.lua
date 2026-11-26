-- Resolve the remote default branch (e.g. "origin/main")
local function default_branch()
  local ref = vim.fn.systemlist("git rev-parse --abbrev-ref origin/HEAD")[1]
  if vim.v.shell_error == 0 and ref and ref ~= "" and ref ~= "origin/HEAD" then
    return ref
  end

  -- Fallback if origin/HEAD isn't set
  for _, b in ipairs({ "origin/main", "origin/master" }) do
    vim.fn.system({ "git", "rev-parse", "--verify", "--quiet", b })
    if vim.v.shell_error == 0 then
      return b
    end
  end
  vim.notify("Could not determine origin default branch", vim.log.levels.ERROR)
end

return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-mini/mini.icons",
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
      {
        "<leader>gD",
        function()
          local base = default_branch()
          if not base then return end
          -- base...HEAD = diff from merge-base to HEAD; --imply-local makes the
          -- HEAD side your real working files (editable, LSP works)
          vim.cmd("DiffviewOpen " .. base .. "...HEAD --imply-local")
        end,
        desc = "Git Diff: Branch vs default",
      },
      {
        "<leader>gH",
        function()
          local base = default_branch()
          if not base then return end
          -- Commits on this branch that aren't on the default branch
          vim.cmd("DiffviewFileHistory --range=" .. base .. "..HEAD")
        end,
        desc = "Git Diff: Branch history vs default",
      },
    },
  },
}
