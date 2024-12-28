return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    event = 'VeryLazy',
    opts = {
      filetypes = {
        'javascript',
        'javascriptreact',
        'json',
        'jsonc',
        'typescript',
        'typescript.tsx',
        'typescriptreact',
      },
      on_attach = function() end,
      settings = {
        separate_diagnostic_server = true,
        tsserver_max_memory = 'auto',
        expose_as_code_action = 'all',
        tsserver_plugins = {
          '@styled/typescript-styled-plugin',
        },
        include_completions_with_insert_text = true,
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeCompletionsForModuleExports = true,
          quotePreference = 'auto',
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayVariableTypeHints = true,
        },
        code_lens = 'off',
        jsx_close_tag = {
          enable = false,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- Adds LSP completion capabilities
      'williamboman/mason.nvim',
      { 'williamboman/mason-lspconfig.nvim', opts = {} },
    },
    config = function()
      local lspconfig = require 'lspconfig'

      local cmp_nvim_lsp = require 'cmp_nvim_lsp'

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- configure html server
      lspconfig['html'].setup {
        capabilities = capabilities,
      }

      -- configure typescript server with plugin
      -- lspconfig['tsserver'].setup {
      --   capabilities = capabilities,
      -- }

      -- configure css server
      lspconfig['cssls'].setup {
        capabilities = capabilities,
      }

      lspconfig['jsonls'].setup {
        capabilities = capabilities,
      }

      lspconfig['intelephense'].setup {
        capabilities = capabilities,
      }

      lspconfig['volar'].setup {
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          vue = {
            -- disable hybrid mode
            hybridMode = false,
          },
        },
        capabilities = capabilities,
      }

      -- configure lua server
      lspconfig['lua_ls'].setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              library = {
                [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                [vim.fn.stdpath 'config' .. '/lua'] = true,
              },
            },
            diagnostics = {
              globals = { 'vim' },
            },
            telemetry = { enable = false },
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      }
    end,
  },
}
