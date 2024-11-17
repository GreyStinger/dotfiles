local generalSettingsGroup = vim.api.nvim_create_augroup('General Settings', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Add $ to keywords for php files',
  group = vim.api.nvim_create_augroup('php-keyword-manage', { clear = true }),
  pattern = {'*.php'},
  callback = function()
    vim.fn['coc#add_extension']('coc-phpls')
  end,
})

