local logger = require('mine.utils.logger')

-- set up plugins
local function ensure_installed()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system('git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
        vim.cmd('packadd packer.nvim')
        return true
    end

    return false
end

local first_install = ensure_installed()

local ok,  packer = pcall(require, 'packer')
if not ok then
    logger.error('Unable to load packer.')
    return
end

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
            local keymaps = require('mine.plugins.telescope').keymaps

            require('telescope').setup({
                defaults = {
                    mappings = keymaps.prompt_window
                }
            })

            require('mine.utils.mapper').map(keymaps.general)
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
                    'dockerfile',
                    'rust'
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
            require('mine.utils.mapper').map({
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
            require('mine.utils.mapper').map({
                n = {
                    ['<Leader>e'] = api.tree.toggle
            --[[   ]]   }
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

            require('mine.utils.mapper').map({
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

            require('mine.utils.mapper').map({
                n = {
                    ['<Leader>t'] = ':ToggleTerm<CR>'
                }
            })
        end
    })

    -- tabout
    use({
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup()
        end
    })

    if first_install then
        packer.sync()
    end
end)
