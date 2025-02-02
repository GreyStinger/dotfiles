-- TODO: Fix and renew this file to new standards
return {
  "lewis6991/hover.nvim",
  name = "hover",
  lazy = true,
  event = "VeryLazy",
  init = function()
    require("hover.providers.lsp")
    require("hover.providers.man")
    require('hover.providers.diagnostic')
  end,
  opts = {
    preview_opts = {
      border = "rounded"
    },
    preview_window = true,
    title = true,
  },
  config = function(_, opts)
    require("hover").setup(opts)

    -- Setup keymaps
    vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
    vim.keymap.set("n", "gK", require("hover").hover_select,
      {desc = "hover.nvim (select)"})
    vim.keymap.set("n", "<C-p>", function()
        require("hover").hover_switch("previous")
      end, {desc = "hover.nvim (previous source)"})
    vim.keymap.set("n", "<C-n>", function()
        require("hover").hover_switch("next")
      end, {desc = "hover.nvim (next source)"})

    -- vim.keymap.set("n", "<leader>hd", function()
    --     require("hover").hover
    --   end, { noremap = true, desc = "Show hover diagnostics" })
  end,
}

