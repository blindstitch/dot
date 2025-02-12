require('packersetup')
require('plugins')
require('pluginsettings')
require('autosave') -- more generically this is my functions
-- require('tex')
require('build')
-- require('lsp')
require('keymaps')
require('functions')

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

-- override highlight group
vim.cmd(':hi MatchParen cterm=bold guifg=bg1 guibg=base1')

-- fix middle click paste?
-- no worky - online claims (incorrectly) that it's not on vim's end, which can't be right
-- because vim is pasting from its buffers that are not stored in the system
if vim.fn.has('mouse') == 1 then
    vim.o.mouse = 'a'
    vim.api.nvim_set_keymap('n', '<MiddleMouse>', '<Nop>', {noremap = true})
end
