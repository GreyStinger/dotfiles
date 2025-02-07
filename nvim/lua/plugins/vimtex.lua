return {
  "lervag/vimtex",
  -- lazy = true,     -- we don't want to lazy load VimTeX
  ft = "tex",
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_engine = "lualatex"
  end
}
