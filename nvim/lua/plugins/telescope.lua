return {
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim'
    },
    config = true,

    opts = function()
      local actions = require("telescope.actions")

      -- local find_files_no_ignore = function()
      --   local action_state = require("telescope.actions.state")
      --   local line = action_state.get_current_line()
      --   LazyVim.telescope("find_files", { no_ignore = true, default_text = line })()
      -- end
      -- local find_files_with_hidden = function()
      --   local action_state = require("telescope.actions.state")
      --   local line = action_state.get_current_line()
      --   LazyVim.telescope("find_files", { hidden = true, default_text = line })()
      -- end
      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              -- ["<c-t>"] = open_with_trouble,
              -- ["<a-t>"] = open_with_trouble,
              -- ["<a-i>"] = find_files_no_ignore,
              -- ["<a-h>"] = find_files_with_hidden,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
      }
    end,
    keys = {
      {
        "<leader><leader>",
        function()
          require('telescope.builtin').buffers()
        end,
        desc = "[ ] Find existing buffers"
      },
      {
        "<leader>sf",
        function()
          require('telescope.builtin').find_files()
        end,
        desc = "[S]earch [F]iles"
      },
      {
        "<leader>sg",
        function()
          require('telescope.builtin').live_grep()
        end,
          desc = "[S]earch by [G]rep"
      },
      {
        "<leader>sd",
        function()
          require('telescope.builtin').diagnostics()
        end,
        desc = "[S]earch [D]iagnostics"
      }
    },
  }
}
