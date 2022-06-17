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
end)
