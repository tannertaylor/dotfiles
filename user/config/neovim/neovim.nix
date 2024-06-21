{ ... }@inputs: {
  imports = [
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.cyberdream.enable = true;

    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;
      statuscolumn = "%C %s %=%l %=%r ";
    };

    plugins = {}
      // (import plugins/cmp.nix inputs)
      // (import plugins/lsp.nix inputs)
      // (import plugins/telescope.nix inputs)
      // (import plugins/treesitter.nix inputs)
    ;

    extraConfigLua = "vim.diagnostic.config({ update_in_insert = true })";
  };
}
