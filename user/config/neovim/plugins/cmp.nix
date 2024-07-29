{ ... }: let
  sources = [ "nvim_lsp" "buffer" "calc" "path" "nvim_lsp_signature_help" ];
in {
  cmp.enable = true;
  cmp.settings.enabled = true; # override enabled so that completion can appear anywhere
  cmp.settings.sources = map (source: { name = source; }) sources;
  cmp.settings.mapping = {
    "<CR>" = "cmp.mapping.confirm({ select = false })";
    "<Tab>" = "cmp.mapping.confirm({ select = true })";
    "<C-j>" = "cmp.mapping.select_next_item()";
    "<C-k>" = "cmp.mapping.select_prev_item()";
  };
  cmp.settings.completion.completeopt = "menu,menuone"; # drops noselect from the default setting

  # Snippet Engine
  luasnip.enable = true;
  cmp.settings.snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
}
