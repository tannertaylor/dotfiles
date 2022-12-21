return {
    map = function(keymaps)
        for _, mode in ipairs({ 'n', 'i', 'v' }) do
            if keymaps[mode] ~= nil then
                for lhs, rhs in pairs(keymaps[mode]) do
                    vim.keymap.set(mode, lhs, rhs, { silent = true })
                end
            end
        end
    end
}
