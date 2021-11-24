-- imports
local lsp = require("lspconfig")
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

-- setup LSP client capabilities
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
client_capabilities = require("cmp_nvim_lsp").update_capabilities(client_capabilities)

-- setup lua language server
-- LspInstall lua
local sumneko_root_path = vim.fn.stdpath("data") .. "/lspinstall/lua/sumneko-lua/extension/server"
local sumneko_bin_path = sumneko_root_path .. "/bin/Linux/lua-language-server"

lsp["sumneko_lua"].setup {
    cmd = { sumneko_bin_path, "-E", sumneko_root_path .. "/main.lua" },
    capabilities = client_capabilities,
    settings = {
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
}

-- setup omnisharp
-- LspInstall csharp
local omnisharp_bin_path = vim.fn.stdpath("data") .. "/lspinstall/csharp/omnisharp/run"
local nvim_pid = vim.fn.getpid()

lsp["omnisharp"].setup {
    cmd = { omnisharp_bin_path, "--languageserver", "--hostPID", tostring(nvim_pid) },
    capabilities = client_capabilities
}
