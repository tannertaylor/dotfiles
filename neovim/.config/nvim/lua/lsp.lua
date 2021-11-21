-- imports
local lsp = require("lspconfig")
local auto_complete = require("cmp")

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
        ["<CR>"] = auto_complete.mapping(auto_complete.mapping.confirm({ select = true }), { "i" })
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
    cmd = { sumneko_bin_path, "-E", sumneko_root_path .. "/main.lua" };
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
local omnisharp_bin_path = "/usr/bin/omnisharp"
local nvim_pid = vim.fn.getpid()

lsp["omnisharp"].setup {
    cmd = { omnisharp_bin_path, "--language-server", "--hostPID", tostring(nvim_pid) }
}
