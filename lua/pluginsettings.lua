vim.cmd [[ colorscheme NeoSolarized ]]
vim.cmd [[ set background=light ]]


-- nvim-tree
vim.opt.termguicolors = true
-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()

local telescope = require('telescope')
-- the extensions are not setup anymore
telescope.setup({
    -- ...
    extensions = {
        heading = {
	    picker_opts = {sorting_strategy = 'ascending'},
            treesitter = true,
        },
    },
})

require('scrollview').setup({
  excluded_filetypes = {'nerdtree'},
  current_only = true,
  base = 'right',
  column = 2,
  -- scrollview_signs_column = 1,
  signs_column=1,
  signs_overflow =1,
  signs_on_startup = {'all'},
  diagnostics_severities = {vim.diagnostic.severity.ERROR},
})

require("auto-save").setup({
  enable = true,
    condition = function(buf)
      -- only run for gitted buffers
      if isbufgitted() then
        return true
      end
      return false
    end
})


-- Was using this more when my setup was unreliable and i was tired of opening the same buffers a lot
-- require("auto-session").setup {
--   auto_session_enabled = true,
--   auto_restore_enabled = true,
--   log_level = "error",
--   auto_session_root_dir = '~/.config/nvim/sessions/',
--       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
-- }


-- telescope.load_extension('heading')
-- -- telescope
-- require('telescope').load_extension('heading')

-- -- autocomplete
-- vim.cmd [[set completeopt=menu,noinsert,noselect]]
-- 
-- vimtex
-- vim.g.vimtex_compiler_method = 'tectonic'
-- 
-- -- treesitter
-- require('nvim-treesitter.configs').setup({
--     ensure_installed = {
--         -- ..
--         'markdown',
--         'rst',
-- 	'latex'
--         -- ..
--     },
-- })
