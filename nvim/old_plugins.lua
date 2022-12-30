packer.startup(function(use)
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
end)
