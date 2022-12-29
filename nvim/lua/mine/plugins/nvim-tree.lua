return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = {
        on_attach = function(bufnr)
            vim.keymap.set('n', 'V', function()
                require('nvim-tree.api').node.open.vertical()
            end)
        end
    },
    keys = {
        { '<Leader>e', function() require('nvim-tree.api').tree.toggle() end }
    }
}
