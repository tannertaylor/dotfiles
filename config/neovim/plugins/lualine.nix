{ pkgs, ... }: with pkgs; {
  package = symlinkJoin {
    name = "lualine";
    paths = [ vimPlugins.lualine-nvim vimPlugins.lualine-lsp-progress ];
  };

  setup = ''
    local function lualine_lsp_clients()
      local clients = ""
      for _, v in ipairs(vim.lsp.get_active_clients()) do
        clients = clients .. ", " .. v.name
      end

      clients = string.sub(clients, 3)
      return "LSP: " .. (#clients > 0 and clients or "none")
    end

    require("lualine").setup({
      options = { icons_enabled = true },
      sections = {
        lualine_c = {
          "lsp_progress",
          lualine_lsp_clients,
        },
      },
    })
  '';
}
