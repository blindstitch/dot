require('autosave') -- more generically this is my functions
require('plugins')
require('pluginsettings')
require('build')
-- require('lsp')
require('keymaps')

-- vim.opt.swapfile = false

-- Suspect that globals don't belong in here
-- vim.opt.sessionoptions = 'buffers,curdir,folds,localoptions,options'

vim.opt.number = true
vim.opt.wrap = true
vim.opt.wrap.breakat = ' '
vim.opt.wrap.nolist = true
vim.opt.ignorecase = true
vim.opt.cursorline = true
vim.opt.scrolloff = 6

vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.bo.softtabstop = 3

vim.opt.undofile = true
