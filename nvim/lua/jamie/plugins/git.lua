return {
  {
    'tpope/vim-fugitive',
    event = 'BufEnter',
    keys = {
      {
        '<leader>gs',
        function()
          local gitsigns = require 'gitsigns'
          gitsigns.stage_hunk()
        end,
        desc = '[G]it [S]tage Hunk',
      },
      {
        '<leader>gr',
        function()
          local gitsigns = require 'gitsigns'
          gitsigns.reset_hunk()
        end,
        desc = '[G]it [R]eset Hunk',
      },
    },
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
      signs_staged = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        vim.keymap.set("n", "]n", function()
          gitsigns.nav_hunk("next")
        end, { buffer = bufnr, desc = "Go to Next Hunk" })
        vim.keymap.set("n", "[n", function()
          gitsigns.nav_hunk("prev")
        end, { buffer = bufnr, desc = "Go to Previous Hunk" })
        vim.keymap.set('n', '<leader>gh', gitsigns.preview_hunk, { buffer = bufnr, desc = '[G]it Preview [H]unk' })
        vim.keymap.set('n', '<leader>gd', function()
          require('gitsigns').toggle_linehl()
          require('gitsigns').toggle_deleted()
          require('gitsigns').toggle_word_diff()
        end, { desc = 'Toggle word diff' })
      end,
    },
  },
}
