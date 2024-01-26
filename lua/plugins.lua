-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  use {'nvim-tree/nvim-tree.lua',requires={'nvim-tree/nvim-web-devicons'}}
  use 'wbthomason/packer.nvim'
  use 'overcache/NeoSolarized'
  use 'nvim-lua/plenary.nvim'
  use 'mbbill/undotree'
  use 'nmac427/guess-indent.nvim'
  use 'dstein64/nvim-scrollview'
--  Was not really using, I think
--  use 'lervag/vimtex'
--  use "williamboman/mason.nvim"
--  use "williamboman/mason-lspconfig.nvim"
--  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
--  use 'nvim-treesitter/nvim-treesitter' -- does this work at all either
--  use 'rmagatti/auto-session' --suspect that this does not work
  use 'okuuva/auto-save.nvim'
 
   use { 'nvim-telescope/telescope.nvim', tag = '0.1.5',
          requires = { {'nvim-lua/plenary.nvim'} }
       }
  use 'folke/zen-mode.nvim'
 
   use 'nvim-telescope/telescope-symbols.nvim' -- whats this
   use 'crispgm/telescope-heading.nvim'
 
end)
