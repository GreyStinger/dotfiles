return {
  'neovim/nvim-lspconfig',
  lazy = true,
  event = "BufReadPre",
  config = function()
    local nvim_lsp = require('lspconfig')
    nvim_lsp.ccls.setup({})
    nvim_lsp.zls.setup({})
    nvim_lsp.bashls.setup({})
    nvim_lsp.csharp_ls.setup({})
    nvim_lsp.lemminx.setup({})
    nvim_lsp.texlab.setup({})
    nvim_lsp.svelte.setup({})
    nvim_lsp.pyright.setup({})
    nvim_lsp.denols.setup({
      root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
    })
    nvim_lsp.lua_ls.setup({
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
          }
        })
      end,
      settings = {
        Lua = {}
      }
    })
  end,
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

