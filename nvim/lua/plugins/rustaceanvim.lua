return {
  'mrcjkb/rustaceanvim',
  enabled = true,
  version = false,
  lazy = false,
  keys = {
      {"<leader>rf", "<cmd>RustFmt<CR>", desc = "Reformat Rust code with RustFmt", mode = "n"},
  }
}

