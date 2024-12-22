return {
  "pmizio/typescript-tools.nvim",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      code_lens = "all",
      disable_member_code_lens = false,
      jsx_close_tag = {
        enable = false,
        filetypes = { "javascriptreact", "typescriptreact" },
      }
    }
  },
  -- config = function(opts)
  --   require('typ')
  -- end,
  ft = { "typescript", "typescriptreact" },
}
