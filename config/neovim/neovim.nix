{ config, pkgs, lib, ... }@inputs: with pkgs; with lib; with builtins; let
  plugins = [
    ./lsp/main.nix
    ./plugins/bufferline.nix
    ./plugins/cmp.nix
    ./plugins/comment.nix
    ./plugins/dap.nix
    ./plugins/dressing.nix
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

  options = with options; {
    notes = {
      enable = mkEnableOption "enable note taking configuration";
    };
  };

  config.programs.nixvim = {
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
      nvim-autopairs.enable = true;
      ts-autotag.enable = true;
    } // attrsets.mergeAttrsList(map (plugin: import plugin inputs) plugins);

    extraPlugins = [
      vimPlugins.omnisharp-extended-lsp-nvim
    ] ++ map (x: x.package) extraPlugins;

    extraConfigLua = with builtins; let
      extraPluginsWithSetup = filter (x: x ? setup) extraPlugins;
      extraPluginsLua = concatStringsSep "\n" (map (x: "${x.setup}\n") extraPluginsWithSetup);
    in ''
      vim.diagnostic.config({ update_in_insert = true })

      ${extraPluginsLua}
    '';

    extraConfigLuaPre = "tt = {}"; # create global tt module for sharing custom lua code throughout my config
  };
}
