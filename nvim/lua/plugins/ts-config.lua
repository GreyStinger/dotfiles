return {
  "pmizio/typescript-tools.nvim",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = true,
  ft = { "typescript", "typescriptreact" }, -- This line ensures the plugin only loads for TypeScript files
}

