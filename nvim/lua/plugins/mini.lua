return {
  "echasnovski/mini.nvim",
  event = "BufRead",
  version = false,
  config = function()
    require('mini.surround').setup()
    require('mini.trailspace').setup()

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end
}

