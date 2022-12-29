return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-n>'] = actions.cycle_history_next,
                        ['<C-p>'] = actions.cycle_history_prev,

                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,

                        ['<C-v>'] = actions.file_vsplit
                    }
                }
            }
        })
    end,
    keys = {
        { 'gf', ':Telescope find_files<CR>' },
        { 'ga', ':Telescope live_grep<CR>' },
        { 'g?', ':Telescope help_tags<CR>' }
    }
}
