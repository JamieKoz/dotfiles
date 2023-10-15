local colorscheme = 'catppuccin'

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
      cat.setup {
        transparent_background = true,
      }

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
}
