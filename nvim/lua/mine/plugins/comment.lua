return {
    'terrortylor/nvim-comment',
    config = function()
        require('nvim_comment').setup()
        vim.keymap.set('n', '<Leader>/', ':CommentToggle<CR>')
        vim.keymap.set('v', '<Leader>/', ':\'<,\'>CommentToggle<CR>')
    end
}
