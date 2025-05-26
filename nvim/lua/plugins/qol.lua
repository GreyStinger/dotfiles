return {
  {
    "chentoast/marks.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
  },
  {
    "tpope/vim-sleuth",
    lazy = true,
    event = "BufReadPre",
  },
  {
    "farmergreg/vim-lastplace",
    lazy = false,
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
  {
    "3rd/time-tracker.nvim",
    lazy = true,
    dependencies = {
      "3rd/sqlite.nvim",
    },
    event = "VeryLazy",
    opts = {
      data_file = vim.fn.expand("$HOME/time-tracker.db")
    },
  }
}
