return {
  'mrcjkb/rustaceanvim',
  enabled = true,
  event = "VeryLazy",
  version = false,
  lazy = false,
  keys = {
      {"<leader>rrf", "<cmd>RustFmt<CR>", desc = "Reformat Rust code with RustFmt", mode = "n"},
  }
}

