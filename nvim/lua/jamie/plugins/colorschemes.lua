local colorscheme = 'tokyonight-moon'

return {
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme(colorscheme)
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      local cat = require 'catppuccin'
      cat.setup {}

      vim.cmd.colorscheme(colorscheme)
    end,
  },
  {
    'bluz71/vim-nightfly-guicolors',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd.colorscheme(colorscheme)
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
