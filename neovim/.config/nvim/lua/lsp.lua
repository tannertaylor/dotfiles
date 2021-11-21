local lsp = require("lspconfig")

-- setup lua language server
local sumneko_root_path = vim.fn.stdpath("data") .. "/lspinstall/lua/sumneko-lua/extension/server"
local sumneko_bin_path = sumneko_root_path .. "/bin/Linux/lua-language-server"

lsp.sumneko_lua.setup {
    cmd = { sumneko_bin_path, "-E", sumneko_root_path .. "/main.lua" };
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

lsp.omnisharp.setup {
    cmd = { omnisharp_bin_path, "--language-server", "--hostPID", tostring(nvim_pid) }
}
