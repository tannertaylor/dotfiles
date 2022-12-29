return {
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
            highlight = { enable = true }
        })
    end
}
