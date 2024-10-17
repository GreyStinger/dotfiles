vim.cmd('set notimeout')  -- Safety net

vim.g.mapleader = " "
vim.g.maplocalleader = " "


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "mhinz/vim-startify",
    lazy = vim.fn.argc() ~= 0,
    event = "TabEnter"
  },
  { import = "plugins" }
})

require("config.core")
require("config.telescope")
require("config.clang-format-cfg")
