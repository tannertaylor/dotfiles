local M = { }

M.set_keymaps = function (bufnr)
    local map = function(keys, command)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', keys, command, {
            noremap = true,
            silent = true
        })
    end

    map('gd', ':lua vim.lsp.buf.definition()<CR>')
    map('gD', ':lua vim.lsp.buf.declaration()<CR>')
    map('gi', ':Telescope lsp_implementations<CR>')
    map('gr', ':Telescope lsp_references<CR>')
    map('gh', ':lua vim.lsp.buf.hover()<CR>')
    map('<C-r>', ':lua vim.lsp.buf.rename()<CR>')
end

return M
