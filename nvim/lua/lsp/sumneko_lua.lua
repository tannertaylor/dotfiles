local settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
      path = {
        '?.lua',
        '?/init.lua'
      }
    },
    workspace = {
      library = { }
    },
    diagnostics = {
      globals = { }
    },
    telemetry = {
      enable = false
    }
  }
}

if (string.find(vim.fn.getcwd(), '/dotfiles/nvim')) then
  table.insert(settings.Lua.diagnostics.globals, 'vim')
  table.insert(settings.Lua.workspace.library, vim.api.nvim_get_runtime_file("", true))
end

return {
  cmd = { 'lua-language-server' },
  settings = settings
}
