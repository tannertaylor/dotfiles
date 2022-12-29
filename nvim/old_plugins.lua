packer.startup(function(use)
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
end)
