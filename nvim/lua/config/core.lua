local opt = vim.opt

opt.autoindent = true
opt.cc = "81" -- 81 so I don't write over it
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.cursorline = true
opt.encoding = 'utf-8'
opt.expandtab = true
opt.foldlevel = 99
opt.foldtext = ""
opt.guifont = 'JetBrainsMono Nerd Font:h12'
opt.hidden = true
opt.hlsearch = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 2
opt.showmode = false -- Dont show mode since we have a statusline
opt.signcolumn = "yes:2" -- Always show the signcolumn
opt.sidescrolloff = 8
opt.smoothscroll = true
opt.shiftwidth = 4
opt.splitright = true -- Put new windows right of current
opt.splitbelow = true -- Put new windows below current
opt.spelllang = { "en" }
opt.softtabstop = 4
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undolevels = 10000
opt.undofile = true
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest,list"

opt.syntax = "on"
vim.cmd("filetype plugin on")
vim.cmd("filetype plugin indent on")

vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- Terminal mode options
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

local map = vim.keymap.set

map("n", "<leader>q", ":q<CR>", { noremap = true })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Tab Management
map("n", "<M-l>", "<cmd>tabnext<CR>", {noremap=true, desc="Navigate Tab Right"})
map("n", "<M-h>", "<cmd>tabNext<CR>", {noremap=true, desc="Navigate Tab Left"})

-- Buffer execute singular
map("n", "<leader>bd", function()
  if vim.bo.modified then
    print("Buffer has unsaved changes")
  else
    vim.cmd('bdelete')
  end
end, { noremap = true, silent = true })


-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

