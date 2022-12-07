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

-- set up autocmd to sync/compile when this file is saved
local initFile = vim.fn.expand('~/**/nvim/init.lua')
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PackerResync', { clear = true }),
    pattern = initFile,
    callback = function(data)
        dofile(initFile)
        packer.sync()
    end
})

-- packer set-up
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

    -- custom modes
    use('Iron-E/nvim-libmodal')

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

    -- autopairs
    use({ 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end })

    -- comments
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

    -- file explorer
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

    -- gitsigns
    use({
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    })

    -- bufferline
    use({
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup({
                options = {
                    offsets = {
                        {
                            filetype = 'NvimTree',
                            text = 'File Explorer',
                            text_align = 'center'
                        }
                    }
                }
            })

            require('utils').map({
                -- n = {
                    -- ['<Leader>h'] = ':BufferLineCyclePrev<CR>',
                    -- ['<Leader>l'] = ':BufferLineCycleNext<CR>'
                -- }
            })
        end
    })

    -- toggleterm
    use({
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup({
                direction = 'float'
            })

            require('utils').map({
                n = {
                    ['<Leader>t'] = ':ToggleTerm<CR>'
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
