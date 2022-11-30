local utils = require('utils')

-- set globals
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set options
local ok, options = pcall(require, 'options')
if not ok then
    utils.log.error('Unable to load options.')
    return
end

for key, value in pairs(options) do
    vim.opt[key] = value
end

-- set up plugins
local first_install = utils.packer.ensure_installed()

local ok,  packer = pcall(require, 'packer')
if not ok then
    utils.log.error('Unable to load packer.')
    return
end

packer.reset()
packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end
    }
})

packer.startup(function(use)
    -- have packer manage itself
    use('wbthomason/packer.nvim')

    -- common dependencies
    use('nvim-lua/popup.nvim')
    use('nvim-lua/plenary.nvim')

    -- colorschemes
    use({
        'lunarvim/colorschemes',
        config = function()
            vim.cmd('colorscheme darkplus')
        end
    })

    -- completion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-nvim-lsp')

    -- snippets
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')

    -- LSP
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')
    use('neovim/nvim-lspconfig')

    -- fuzzy finder
    use({
        'nvim-telescope/telescope.nvim',
        config = function()
            local keymaps = require('keymaps.telescope')

            require('telescope').setup({
                defaults = {
                    mappings = keymaps.prompt_window
                }
            })

            require('utils').map(keymaps.general)
        end
    })

    -- treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'c_sharp',
                    'json',
                    'lua',
                    'gitignore',
                    'gitcommit',
                    'dockerfile'
                },
                sync_install = false,
                highlight = {
                    enable = true
                }
            })
        end
    })

    -- misc plugins
    use({ 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end })
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()

            local api = require('Comment.api')
            require('utils').map({
                n = {
                    ['<Leader>cc'] = api.toggle.linewise.current
                },
                -- TODO: Fix this broken keymap
                v = {
                    ['<Leader>cc'] = api.toggle.blockwise.count
                }
            })
        end
    })
    use({
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup()

            local api = require('nvim-tree.api')
            require('utils').map({
                n = {
                    ['<Leader>e'] = api.tree.toggle
                }
            })
        end
    })

    if first_install then
        packer.sync()
    end
end)

require('keymaps')
require('completion')
require('lsp')
