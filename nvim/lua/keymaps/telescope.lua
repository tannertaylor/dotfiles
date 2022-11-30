local M = { }

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

M.prompt_window = {
    i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,

        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous
    }
}

M.general = {
    n = {
        ['gf'] = builtin.find_files, --builtin.find_files,
        ['ga'] = builtin.live_grep,
        ['g?'] = builtin.help_tags
    }
}

return M
