-- Things I want
--
-- changes i need to make to the syntax highlighting:
--  - coloring for tags is terrible as always. make the colors unchanging, use dark for
--    currently selected, lighter shade for the other side, or green, something unused. 
--    red conflicts too much with the color used for characters presently.
--
-- tex:
--  - wrapping is very broken for figures
--
--
-- keymaps:
--  - changing word with cw, dw, should always behave as caw, daw - there's ce and de for the other cases
--  - c-w should not delete separator characters, it should behave more like daw.
--  - sentence movement needs fixing, there's an error with how parens are mapped.
--
--
--[[
notes for a baby
 - packer plugins must be installed with PackerInstall
 - packer is installed with code in plugins.lua
 - must be updated with PackerUpdate
 - you can do subfolders and reference htem with dot notation - ex: 'lua/user/foo.nvim' is 'require('user.foo')
]]-- 

require('keymaps')
require('plugins')
require('build')
require('lsp')


vim.opt.number = true
-- vim.opt.swapfile = false

-- Suspect that globals don't belong in here
-- vim.opt.sessionoptions = 'buffers,curdir,folds,localoptions,options'

vim.opt.wrap = true
vim.opt.wrap.breakat = ' '
vim.opt.wrap.nolist = true
vim.opt.ignorecase = true

vim.cmd [[ colorscheme NeoSolarized ]]
vim.cmd [[ set background=light ]]



vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.bo.softtabstop = 3

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- plugin settings - move these elsewhere

-- nvim-tree recommended settings
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
--    mappings = {
--      list = {
--        { key = "u", action = "dir_up" },
--      },
--    },
    on_attach = on_attach,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
--   update_focused_file = {
--   enable = true,
--   update_cwd = true,
-- },
})
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- autocomplete
vim.cmd [[set completeopt=menu,noinsert,noselect]]

-- vimtex
vim.g.vimtex_compiler_method = 'tectonic'


-- telescope
require('telescope').load_extension('heading')

-- treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = {
        -- ..
        'markdown',
        'rst',
	'latex'
        -- ..
    },
})
local telescope = require('telescope')
telescope.setup({
    -- ...
    extensions = {
        heading = {
	    picker_opts = {sorting_strategy = 'ascending'},
            treesitter = true,
        },
    },
})
telescope.load_extension('heading')

require("auto-session").setup {
  auto_session_enabled = true,
  auto_restore_enabled = true,
  log_level = "error",
  auto_session_root_dir = '~/.config/nvim/sessions/',
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
}

vim.opt.undofile = true
