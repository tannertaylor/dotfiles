-- imports
local lsp_installer = require("nvim-lsp-installer")
local auto_complete = require("cmp")

-- LSP handler overrides
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true
    }
)

-- setup auto-complete
auto_complete.setup({
    snippet = {
       expand = function(args)
           vim.fn["vsnip#anonymous"](args.body)
       end,
    },
    sources = auto_complete.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" }
    }),
    mapping = {
        ["<CR>"] = auto_complete.mapping(auto_complete.mapping.confirm({ select = true }), { "i" }),
        ["<Tab>"] = auto_complete.mapping(auto_complete.mapping.select_next_item(), { "i", "c" }),
        ["<S-Tab>"] = auto_complete.mapping(auto_complete.mapping.select_prev_item(), { "i", "c" })
    }
})

-- install language servers
local servers = {
    "bashls",
    "clangd",
    "cssls",
    "dockerls",
    "html",
    "jsonls",
    "omnisharp",
    "pyright",
    "sumneko_lua",
    "sqlls",
    "tsserver",
    "yamlls"
}

for _, server_name in ipairs(servers) do
    local server_found, server = lsp_installer.get_server(server_name)
    if server_found then
        if not server:is_installed() then
            server:install()
        end
    end
end

-- setup LSP client capabilities
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
client_capabilities = require("cmp_nvim_lsp").update_capabilities(client_capabilities)

-- setup language servers
lsp_installer.on_server_ready(function(server)
    local options = {
        capabilities = client_capabilities
    }

    if server.name == "sumneko_lua" then
        options.settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";")
                },
                diagnostics = {
                    globals = { "vim" }
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true)
                },
                telemetry = {
                    enable = false
                }
            }
        }
    end

    server:setup(options)
end)
