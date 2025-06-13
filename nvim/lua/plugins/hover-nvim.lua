-- TODO: Fix and renew this file to new standards
return {
  "lewis6991/hover.nvim",
  name = "hover",
  lazy = false,
  opts = {
    init = function()
      require("hover.providers.lsp")
      require("hover.providers.man")
      require('hover.providers.diagnostic')
    end,
    preview_opts = { border = "rounded" },
    preview_window = true,
    title = true,
  },
  config = function(_, opts)
    require("hover").setup(opts)
  end,
  keys = {
    -- {'K', function() require("hover").hover() end, desc = "hover.nvim"},
    {'K', function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
          if client:supports_method("textDocument/hover") then
            require("hover").hover()
            return
          end
        end
        print("No hover information available")
      end, desc = "hover.nvim"
    },
    {'gK', function() require("hover").hover_select() end, desc = "hover.nvim (select)"},
    {'<C-p>', function() require("hover").hover_switch("previous") end, desc = "hover.nvim (previous source)"},
    {'<C-n>', function() require("hover").hover_switch("next") end, desc = "hover.nvim (next source)"},
  }
}

