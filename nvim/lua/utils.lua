local M = { }

M.log = {
    error = function(message)
        vim.notify(message, vim.log.levels.ERROR)
    end
}

M.packer = {
    ensure_installed = function()
        local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
            vim.fn.system('git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. install_path)
            vim.cmd('packadd packer.nvim')
            return true
        end

        return false
    end
}

M.map = function(keymaps)
    for _, mode in ipairs({ 'n', 'i', 'v' }) do
        if keymaps[mode] ~= nil then
            for lhs, rhs in pairs(keymaps[mode]) do
                vim.keymap.set(mode, lhs, rhs, { silent = true })
            end
        end
    end
end

return M
