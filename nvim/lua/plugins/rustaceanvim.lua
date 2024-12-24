return {
  'mrcjkb/rustaceanvim',
  enabled = true,
  event = "VeryLazy",
  version = false,
  lazy = true,
  keys = {
      {"<leader>rrf", "<cmd>RustFmt<CR>", desc = "Reformat Rust code with RustFmt", mode = "n"},
  }
}

