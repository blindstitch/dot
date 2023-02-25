--[[
notes for a baby
 - packer plugins must be installed with PackerInstall
 - packer is installed with code in plugins.lua
 - must be updated with PackerUpdate
 - you can do subfolders and reference htem with dot notation - ex: 'lua/user/foo.nvim' is 'require('user.foo')
]]-- 

require('plugins')
require('keymaps')
require('build')
require('reload')


-- disable netrw, recommended by nvim-tree maintainer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true

vim.cmd [[ colorscheme NeoSolarized ]]
vim.cmd [[ set background=light ]]

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- nvim-tree recommended settings
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
