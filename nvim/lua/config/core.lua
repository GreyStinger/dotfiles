local opt = vim.opt

opt.hidden = true

opt.guifont = 'JetBrainsMono Nerd Font:h12'
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.encoding = 'utf-8'
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.wildmode = "longest,list"
opt.cc = "81" -- 81 Becuase I don't enjoy writing over it but I want to know where column 80 is
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.cursorline = true
opt.signcolumn = "yes:2" -- Always show the signcolumn
opt.showmode = false -- Dont show mode since we have a statusline
opt.scrolloff = 2
opt.sidescrolloff = 8 -- Columns of context if nowrap is set
opt.termguicolors = true -- True color support
opt.hlsearch = true
opt.swapfile = false

-- Zig issues on my machine with fmt :/
-- vim.g.zig_fmt_autosave = false

opt.syntax = "on"
vim.cmd("filetype plugin on")
vim.cmd("filetype plugin indent on")

vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- Terminal mode options
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'nt', '<cmd>tabedit | terminal<CR>', { noremap = true, silent = true })

local map = vim.keymap.set

map("n", "<leader>q", ":q<CR>", { noremap = true })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- map("n", "<leader>hd", function() vim.diagnostic.open_float() end,
--   {noremap=true,desc="Show hover diagnostics"})

-- Pane Management
map("n", "<leader>psv", "<cmd>vsp<CR>", {noremap=true, desc="[P]ane split [V]ertically" })
map("n", "<leader>psh", "<cmd>sp<CR>", {noremap=true, desc="[P]ane split [H]orizontally" })
map("n", "<C-h>", "<cmd>wincmd h<CR>", {noremap=true, desc="Navigate Pane Left"})
map("n", "<C-j>", "<cmd>wincmd j<CR>", {noremap=true, desc="Navigate Pane Down"})
map("n", "<C-k>", "<cmd>wincmd k<CR>", {noremap=true, desc="Navigate Pane Up"})
map("n", "<C-l>", "<cmd>wincmd l<CR>", {noremap=true, desc="Navigate Pane Right"})
map("n", "<leader><C-h>", "<cmd>wincmd H<CR>", {noremap=true, desc="Move Pane Right"})
map("n", "<leader><C-j>", "<cmd>wincmd J<CR>", {noremap=true, desc="Move Pane Down"})
map("n", "<leader><C-k>", "<cmd>wincmd K<CR>", {noremap=true, desc="Move Pane Up"})
map("n", "<leader><C-l>", "<cmd>wincmd L<CR>", {noremap=true, desc="Move Pane Right"})

-- Tab Management
map("n", "<M-l>", "<cmd>tabnext<CR>", {noremap=true, desc="Navigate Tab Right"})
map("n", "<M-h>", "<cmd>tabNext<CR>", {noremap=true, desc="Navigate Tab Left"})

-- Close empty and unnamed buffers
function CloseEmptyAndUnnamedBuffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local bufname = vim.fn.bufname(buf)
    if bufname == "" or bufname == "[No Name]" then
      vim.cmd("bdelete! " .. buf)
    end
  end
end

vim.cmd('command! CloseEmptyBuffers lua CloseEmptyAndUnnamedBuffers()')

-- Make runs? (Mailnly for my large tex project I'm working on)
map("n", "<leader>mk", "<cmd>!make<CR>",
  { noremap = true, silent = true, desc = "[M]a[K]e in current dir"})
map("n", "<leader>ms", "<cmd>silent !make<CR>",
  { noremap = true, silent = true, desc = "[M]ake [S]ilent"})

-- Buffer things
map("n", "<leader>bcu", function() CloseEmptyAndUnnamedBuffers() end,
  { noremap = true, silent = true, desc = "[B]uffers [C]lose all that are [U]nnamed or empty"})
map("n", "<leader>bca", "<cmd>bufdo bd<CR>",
  { noremap = true, silent = true, desc = "[B]uffers [C]lose [A]ll sans the current"})
-- Buffer execute singular
map("n", "<leader>bx", function()
  if vim.bo.modified then
    print("Buffer has unsaved changes")
  else
    vim.cmd('bdelete')
  end
end, { noremap = true, silent = true })

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

