{ ... }@inputs: {
  programs.nixvim = {
    enable = true;
    colorschemes.cyberdream.enable = true;

    plugins = {}
      // (import plugins/lsp.nix inputs)
      // (import plugins/telescope.nix inputs)
    ;
  };
}
