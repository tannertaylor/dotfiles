{ ... }: let
  sources = [ "nvim_lsp" "buffer" "calc" "path" ];
in {
  cmp.enable = true;
  cmp.settings.sources = map (source: { name = source; }) sources;
  cmp.settings.mapping = {
    "<CR>" = "cmp.mapping.confirm({ select = true })";
    "<Tab>" = "cmp.mapping.confirm({ select = true })";
    "<C-j>" = "cmp.mapping.select_next_item()";
    "<C-k>" = "cmp.mapping.select_prev_item()";
  };

  # Sources
  # cmp-nvim-lsp.enable = true;
  # cmp-async-path.enable = true;
  # cmp-buffer.enable = true;
  # cmp-calc.enable = true;

  # Snippet Engine
  # luasnip.enable = true;
  # cmp.settings.snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
}
