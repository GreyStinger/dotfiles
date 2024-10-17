return {
  'neovim/nvim-lspconfig',
  lazy = true,
  event = "BufReadPre",
  config = function()
    require'lspconfig'.ccls.setup({})

    -- require("lspconfig").phpactor.setup({
    --   init_options = {
    --     ["language_server_phpstan.enabled"] = false,
    --     ["language_server_psalm.enabled"] = false,
    --   },
    -- })

    require('lspconfig').lemminx.setup({}) -- XML language server
    -- require('lspconfig').metals.setup({
    --   filetypes = { "scala", "sbt", "java" }
    -- }) -- Scala language server
    -- require('lspconfig').bashls.setup({})
    -- require('lspconfig').pyright.setup({})
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

