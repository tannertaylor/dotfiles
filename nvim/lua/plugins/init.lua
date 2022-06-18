local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

packer.startup(function(use)
  use('wbthomason/packer.nvim')
  use('neovim/nvim-lspconfig')
  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  })
  use('glepnir/lspsaga.nvim')
  use('nvim-treesitter/nvim-treesitter')
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  })
  use('terrortylor/nvim-comment')
  use('edeneast/nightfox.nvim')

  require('plugins.treesitter')
  require('plugins.nvim-tree')
  require('plugins.nvim-comment')
  require('plugins.nightfox')
end)
