vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = 'if_many',
    prefix = '●',
    severity = { min = vim.diagnostic.severity.WARN },
    -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
    -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
    -- prefix = "icons",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '█ ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = '󰠠 ',
      [vim.diagnostic.severity.INFO] = ' ',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
  },
  severity_sort = true,
}
