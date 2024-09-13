{ pkgs, lib, ... }@inputs: let
  plugins = [
    ./lsp/main.nix
    ./plugins/bufferline.nix
    ./plugins/cmp.nix
    ./plugins/comment.nix
    ./plugins/dap.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
  ];

  extraPlugins = map (x: import x inputs) [
    ./plugins/fterm.nix
    ./plugins/lualine.nix
    ./plugins/which-key.nix
  ];
in {
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
      timeout = true;
      timeoutlen = 300;
    };

    plugins = {
      dressing.enable = true;
      nvim-autopairs.enable = true;
      nvim-tree.enable = true;
      ts-autotag.enable = true;
    } // lib.attrsets.mergeAttrsList(map (plugin: import plugin inputs) plugins);

    extraPlugins = [
      pkgs.vimPlugins.omnisharp-extended-lsp-nvim
    ] ++ map (x: x.package) extraPlugins;

    extraConfigLua = with builtins; let
      extraPluginsWithSetup = filter (x: x ? setup) extraPlugins;
      extraPluginsLua = concatStringsSep "\n" (map (x: "${x.setup}\n") extraPluginsWithSetup);
    in ''
      vim.diagnostic.config({ update_in_insert = true })

      ${extraPluginsLua}
    '';
  };
}
