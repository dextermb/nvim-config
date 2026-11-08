local builtin = require('telescope.builtin')

return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      {
        "<leader>ff",
        builtin.find_files,
        desc = "Telescope: Find files"
      },
      {
        "<leader>fg",
        builtin.live_grep,
        desc = "Telescope: Live grep"
      },
      {
        "<leader>fb",
        builtin.buffers,
        desc = "Telescope: Buffers"
      },
      {
        "<leader>fh",
        builtin.help_tags,
        desc = "Telescope: Help tags"
      },
    },
  }
}
