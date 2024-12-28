-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  pattern = '*',
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
  callback = function(ev)
    local opts = { noremap = true, silent = true, buffer = ev.buf }

    -- Setup keymaps for when when an LSP attaches to the buffer.
    opts.desc = '[L]SP: [R]ename'
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    opts.desc = '[L]SP: Code [A]ction'
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    opts.desc = 'LSP: [G]oto [D]efinition'
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

    opts.desc = 'LSP: [G]oto [R]eferences'
    vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

    opts.desc = 'LSP: [G]oto [I]mplementation'
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

    opts.desc = '[L]SP: [T]ype Definition'
    vim.keymap.set('n', '<leader>lt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

    opts.desc = 'LSP: Hover Documentation'
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- See `:help K` for why this keymap

    opts.desc = 'Show buffer diagnostics'
    vim.keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- See `:help K` for why this keymap

    opts.desc = '[L]SP: [S]ignature Documentation'
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, opts)

    opts.desc = 'LSP: [G]oto [D]eclaration'
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

    opts.desc = 'Open floating diagnostic message'
    vim.keymap.set('n', 'gh', vim.diagnostic.open_float, opts)

    opts.desc = '[L]SP: List [D]iagnostics'
    vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist, opts)
  end,
})
