return {
  lazy = true,
  "3rd/time-tracker.nvim",
  dependencies = {
    "3rd/sqlite.nvim",
  },
  event = "VeryLazy",
  opts = {
    data_file = vim.fn.expand("$HOME/data/time-tracker.db")
  },
}

