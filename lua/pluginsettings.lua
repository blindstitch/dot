-- Auto-save settings are in autosave.lua

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

require('zen-mode').setup({
  window = {
    backdrop = .95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
      -- you may turn on/off statusline in zen mode by setting 'laststatus' 
      -- statusline will be shown only if 'laststatus' == 3
      laststatus = 0, -- turn off the statusline in zen mode
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
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
