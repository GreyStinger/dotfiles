return {
  "nvim-tree/nvim-tree.lua",
  -- If there are no passed arguments or the passed argument is not a directory we lazy load
  -- lazy = not (vim.fn.argc() ~= 0 and vim.fn.isdirectory(vim.fn.getcwd() .. "/" .. vim.fn.argv(-1)[1]) == 1),
  lazy = vim.fn.argc() == 0 or vim.fn.isdirectory(vim.fn.getcwd() .. "/" .. vim.fn.argv(-1)[1]) == 0,
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  name = "nvim-tree",
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 40
      },
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "⇸",
              arrow_open = "↴"
            }
          }
        }
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false
          }
        }
      },
      filters = {
        custom = {".DS_Store"}
      },
      git = {
        ignore = false
      }
    })
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true
  end,
  keys = {
    {"<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Nvim Tree", mode = "n"},
    {"<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle Nvim Tree Find File", mode = "n"},
    {"<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse File Explorer", mode = "n"},
    {"<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh File Explorer", mode = "n"}
  },
}

