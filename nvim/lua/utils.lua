local M = { }

-- message logging functions
M.log = {
    error = function(message)
        vim.notify(message, vim.log.levels.ERROR)
    end
}

-- packer
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

-- keymaps
local function modemap(mode, keymaps)
    for lhs, rhs in pairs(keymaps) do
        vim.keymap.set(mode, lhs, rhs, { silent = true })
    end
end

M.map = function(keymaps)
    for _, mode in ipairs({ 'n', 'i', 'v' }) do
        if keymaps[mode] ~= nil then
            modemap(mode, keymaps[mode])
        end
    end
end

return M
