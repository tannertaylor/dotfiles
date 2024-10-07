--- Retrieve the customized LSP client capabilities table.
local function get_lsp_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, cmp_capabilities)
  return capabilities
end

--- Loads my selection of lspconfigs from the nvim-lspconfig plugin.
local function load_lspconfigs()
  local lspconfigs = {
    "bash_language_server",
    "docker_compose_langserver",
    "docker_langserver",
    "lua_language_server",
    "omnisharp",
  }

  local capabilities = get_lsp_capabilities()

  for _, module in ipairs(lspconfigs) do
    local spec = require("lsp." .. module)

    local opts = spec.opts or { }
    opts.capabilities = opts.capabilities or capabilities

    require("lspconfig")[spec.server_name].setup(opts)
  end
end

tt.lsp = {
  load_lspconfigs = load_lspconfigs,
  get_lsp_capabilities = get_lsp_capabilities,
}
