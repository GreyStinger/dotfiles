return {
  "ej-shafran/compile-mode.nvim",
  branch = "latest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "m00qek/baleia.nvim", tag = "v1.3.0" },
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
        -- to add ANSI escape code support, add:
      baleia_setup = true,
    }
  end
}
