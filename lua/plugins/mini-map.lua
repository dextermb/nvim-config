return {
  {
    "nvim-mini/mini.map",
    config = function()
      local map = require('mini.map')

      local diagnostic_integration = map.gen_integration.diagnostic({
        error = 'DiagnosticFloatingError',
        warn  = 'DiagnosticFloatingWarn',
        info  = 'DiagnosticFloatingInfo',
        hint  = 'DiagnosticFloatingHint',
      })

      local gitsigns_integration = map.gen_integration.gitsigns()

      vim.keymap.set('n', '<Leader>mc', map.close)
      vim.keymap.set('n', '<Leader>mf', map.toggle_focus)
      vim.keymap.set('n', '<Leader>mo', map.open)
      vim.keymap.set('n', '<Leader>mr', map.refresh)
      vim.keymap.set('n', '<Leader>ms', map.toggle_side)
      vim.keymap.set('n', '<Leader>mt', map.toggle)

      map.setup({
        integrations = {
          diagnostic_integration,
          gitsigns_integration,
        }
      })
    end
  }
}
