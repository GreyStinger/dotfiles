return {
  {
    "echasnovski/mini.nvim",
    event = "BufRead",
    version = false,
    config = function()
      require('mini.surround').setup()
      require('mini.trailspace').setup()

      local statusline = require 'mini.statusline'
      statusline.setup {
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git = statusline.section_git({ trunc_width = 75 })
            local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
            local filename = statusline.section_filename({ trunc_width = 140 }) .. " %="
            local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
            local location = statusline.section_location({ trunc_width = 75 })

            -- Noice component with compact styling
            local noice = ""
            if require("noice").api.statusline.mode.has() then
              noice = "%#NoiceStatusline#" .. require("noice").api.statusline.mode.get()
            end

            return statusline.combine_groups({
              { hl = mode_hl,                 strings = { mode } },
              { hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics } },
              { hl = 'MiniStatuslineFilename', strings = { filename } }, -- Expands to fill space
              { hl = 'NoiceStatusline',        strings = { noice } },    -- After filename
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl,                  strings = { location } },
            })
          end
        }
      }

      -- More subtle highlight with smaller right margin
      vim.api.nvim_set_hl(0, 'NoiceStatusline', {
        fg = "#ff9e64",
        bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
        bold = false,  -- Make text less prominent
      })
    end
  },
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {
      mappings = {
        ["`"] = {
          action = "closeopen",
          pair = "``",
          neigh_pattern = "[^\\`].",
          register = { cr = false }
        },
      },
    },
    keys = {
      {
        "<leader>up",
        function()
          vim.g.minipairs_disable = not vim.g.minipairs_disable
          if vim.g.minipairs_disable then
            -- LazyVim.warn("Disabled auto pairs", { title = "Option" })
          else
            -- LazyVim.info("Enabled auto pairs", { title = "Option" })
          end
        end,
        desc = "Toggle Auto Pairs",
      },
    },
  }
}
