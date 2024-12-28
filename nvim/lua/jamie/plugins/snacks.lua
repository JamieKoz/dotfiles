return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    indent = {
      enabled = true,
      animate = { enabled = true },
      chunk = { enabled = true },
      scope = { enabled = true, hl = 'LineNr', char = '│' },
      -- scope = { enabled = true, hl = "Comment", char = "│" },
      indent = {
        char = '┆', -- | ¦ ┆ ┊ │
        hl = 'LineNr',
      },
    },
    scope = { enabled = true },
    input = {
      enabled = false,
    },
    notifier = {
      enabled = true,
      top_down = false,
      style = 'minimal',
      margin = { bottom = 2 },
    },
    quickfile = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true, left = { 'mark', 'sign' }, right = { 'fold', 'git' } },
    words = { enabled = false },
  },
}
