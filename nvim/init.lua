vim.cmd('set notimeout')  -- Safety net

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy-loader")

require("config.core")
require("config.autocmds")
require("config.telescope")
require("config.clang-format-cfg")
