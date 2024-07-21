{ pkgs, ... }@inputs: {
  imports = [
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.gruvbox.enable = true;

    globals = {
      mapleader = " ";
    };

    opts = let
      tabSize = 2;
    in {
      number = true;
      relativenumber = true;
      statuscolumn = "%C %s %=%l %=%r "; # set format of left-hand status column
      clipboard = "unnamedplus"; # use the system clipboard
      ignorecase = true; # ignore case in searches
      showtabline = tabSize;
      splitbelow = true;
      splitright = true;
      swapfile = false;
      termguicolors = true;
      expandtab = true;
      shiftwidth = tabSize;
      tabstop = tabSize;
      cursorline = true;
      signcolumn = "yes";
      scrolloff = 4;
      conceallevel = 1;
    };

    plugins = {
      lspsaga.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      nvim-tree.enable = true;
      ts-autotag.enable = true;
    }
      // (import plugins/bufferline.nix inputs)
      // (import plugins/cmp.nix inputs)
      // (import plugins/comment.nix inputs)
      // (import plugins/dap.nix inputs)
      // (import plugins/lsp.nix inputs)
      // (import plugins/lspsaga.nix inputs)
      // (import plugins/telescope.nix inputs)
      // (import plugins/treesitter.nix inputs)
    ;

    extraPlugins = [ pkgs.vimPlugins.omnisharp-extended-lsp-nvim ];
    extraConfigLua = "vim.diagnostic.config({ update_in_insert = true })";
  };
}
