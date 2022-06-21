local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

packer.startup(function(use)
  use('wbthomason/packer.nvim')

  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lspconfig')
    end
  })

  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  })

  use('glepnir/lspsaga.nvim')

  use({
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.treesitter')
    end
  })

  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({ })
    end
  })

  use({
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({ })
    end
  })

  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup({ })
    end
  })

  use({
    'sainnhe/gruvbox-material',
    vim.cmd('colorscheme gruvbox-material')
  })

  use({
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        direction = 'float'
      })
    end
  })

  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')

  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.cmp')
    end
  })
end)
