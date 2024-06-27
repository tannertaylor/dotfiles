{ ... }@inputs: {
  imports = [
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.ayu.enable = true;

    globals = {
      mapleader = " ";
    };

    opts = let
      tabSize = 4;
    in {
      number = true;
      relativenumber = true;
      statuscolumn = "%C %s %=%l %=%r "; # set format of left-hand status column
      clipboard = "unnamedplus"; # use the system clipboard
      cmdheight = 2; # taller command line window
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
    };

    plugins = {
      nvim-autopairs.enable = true;
      lualine.enable = true;
      oil.enable = true;
    }
      // (import plugins/cmp.nix inputs)
      // (import plugins/lsp.nix inputs)
      // (import plugins/telescope.nix inputs)
      // (import plugins/toggleterm.nix inputs)
      // (import plugins/treesitter.nix inputs)
    ;

    extraConfigLua = "vim.diagnostic.config({ update_in_insert = true })";
  };
}
