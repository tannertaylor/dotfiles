local ok, mason = pcall(require, 'mason')
if not ok then
    return
end

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
    return
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    return
end

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
    return
end

local ok, keymaps = pcall(require, 'lsp.keymaps')
if not ok then
    return
end

local servers = {
    'sumneko_lua',
    'omnisharp'
}

mason.setup()
mason_lspconfig.setup({
    ensure_installed = servers
})

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local options = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        keymaps.set_keymaps(bufnr)
    end
}

for _, server in ipairs(servers) do
    local ok, specific_options = pcall(require, 'lsp.options.' .. server)
    if ok then
        options = vim.tbl_deep_extend('force', specific_options, options)
    end

    lspconfig[server].setup(options)
end
