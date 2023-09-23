dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"

local M = {}
local utils = require "core.utils"
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

require("lspconfig").intelephense.setup({})
--
-- require('lspconfig').vuels.setup({
--     cmd = { "vls"},
--     filetypes = { "vue" },
--     init_options = {
--       config = {
--         css = {},
--         emmet = {},
--         html = {
--           suggest = {}
--         },
--         javascript = {
--           format = {}
--         },
--         stylusSupremacy = {},
--         typescript = {
--           format = {}
--         },
--         vetur = {
--           completion = {
--             autoImport = false,
--             tagCasing = "kebab",
--             useScaffoldSnippets = false
--           },
--           format = {
--             defaultFormatter = {
--               js = "none",
--               ts = "none"
--             },
--             defaultFormatterOptions = {},
--             scriptInitialIndent = false,
--             styleInitialIndent = false
--           },
--           useWorkspaceDependencies = false,
--           validation = {
--             script = true,
--             style = true,
--             template = true
--           }
--         }
--       }
--     }
-- })
-- Setup for vue typescript projects
require('lspconfig').volar.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    -- if client.server_capabilities.inlayHintProvider then
    --   vim.lsp.buf.inlay_hint(bufnr, true)
    -- end
  end,
    init_options = {
        typescript = {
            tsdk = '/Users/jamiekozminska/.volta/tools/shared/typescript/lib'
        }
    },
  capabilities = capabilities,
  -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
  -- This drastically improves the responsiveness of diagnostic updates on change
  filetypes = { 'javascript', 'vue' },
})

-- Tailwind CSS
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

require("lspconfig").lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostics.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostics.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostics.goto_next()<CR>')
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')


return M
