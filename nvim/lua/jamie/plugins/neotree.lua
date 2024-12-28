return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'echasnovski/mini.icons',
    'MunifTanjim/nui.nvim',
    'folke/snacks.nvim',
  },
  event = 'BufEnter',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle [E]xplorer' },
    {
      '<leader>o',
      function()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd.wincmd 'p'
        else
          vim.cmd.Neotree 'focus'
        end
      end,
      desc = 'Toggle F[o]cus Explorer',
    },
  },
  opts = function(_, opts)
    opts = vim.tbl_deep_extend('force', opts, {
      close_if_last_window = true,
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = '',
            deleted = '',
            modified = '',
            renamed = '➜',
            untracked = '★',
            ignored = '◌',
            unstaged = '✗',
            staged = '✓',
            conflict = '',
          },
        },
      },
    })
    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end
    local events = require 'neo-tree.events'
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })
    return opts
  end,
}
