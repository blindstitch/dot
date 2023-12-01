-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'overcache/NeoSolarized'
  use 'nvim-lua/plenary.nvim'
  --use 'pocco81/auto-save.nvim' -- had to nuke because it wouldn't read configs properly
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1',
         requires = { {'nvim-lua/plenary.nvim'} }
      }
  use 'crispgm/telescope-heading.nvim'
  use({
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  })

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }

  use 'lervag/vimtex'

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use('nvim-treesitter/nvim-treesitter')

  use {
  'nmac427/guess-indent.nvim',
  config = function() require('guess-indent').setup {} end,
}

use {
  'rmagatti/auto-session', --suspect that this does not work
}

use 'mbbill/undotree'

use 'nvim-telescope/telescope-symbols.nvim'

use 'dstein64/nvim-scrollview'
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

end)

