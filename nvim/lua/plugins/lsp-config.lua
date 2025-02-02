-- Need to set LUA_LS_PATH to path of the lua-language-server

return {
  'neovim/nvim-lspconfig',
  lazy = true,
  event = "BufReadPre",
  config = function(_, opts)
    local nvim_lsp = require('lspconfig')
    for server, config in pairs(opts.servers) do
      nvim_lsp[server].setup(config)
    end
  end,

  ---@class PluginLspOpts
  opts = {
    servers = {
      astro = {},
      bashls = {},
      ccls = {},
      csharp_ls = {},
      hls = {},
      lemminx = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"},
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
          },
        },
      },
      pyright = {},
      svelte = {},
      texlab = {},
      zls = {}
    },
    inlay_hints = { enabled = true },
  },
  keys = {
    {'gD', function() vim.lsp.buf.declaration() end, desc = "Goto Declaration"}, -- Where a key is declared
    {'gd', function() vim.lsp.buf.definition() end, desc = "Goto Definition"}, -- Where a value for a key is defined
    {'gr', function() vim.lsp.buf.references() end, desc = "List References"},
    {'gi', function() vim.lsp.buf.implementation() end, desc = "Goto implementation"},
    {'<leader>ar', function() vim.lsp.buf.rename() end, desc = "Rename all"},
    {'<leader>ai', function() vim.lsp.buf.incoming_calls() end, desc = "List all incoming calls"},
    {'<leader>ao', function() vim.lsp.buf.outgoing_calls() end, desc = "list all outgoing calls"}
  }
}

