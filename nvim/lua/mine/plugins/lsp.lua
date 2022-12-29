return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'nvim-telescope/telescope.nvim'
    },
    lazy = false,
    config = function()
        local servers = {
            'sumneko_lua',
            'omnisharp'
        }

        local mason, mason_lspconfig = require('mason'), require('mason-lspconfig')
        mason.setup()
        mason_lspconfig.setup({ ensure_installed = servers })

        local lspconfig, cmp_lsp = require('lspconfig'), require('cmp_nvim_lsp')
        local capabilities = cmp_lsp.default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )

        local default_options = {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
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
        }

        for _, server in ipairs(servers) do
            local options = default_options
            local ok, specific_options = pcall(require, 'mine.lsp.' .. server)
            if ok then
                options = vim.tbl_deep_extend('force', specific_options, default_options)
            end
            lspconfig[server].setup(default_options)
        end
    end,
    keys = {

    }
}
