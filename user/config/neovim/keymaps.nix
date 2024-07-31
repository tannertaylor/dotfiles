# Normal mode keymaps are in the which-key config.
{ ... }: let
  keymaps = {
    i = [
      { # Show completion, even if I haven't started typing yet.
        key = "<c-Space>";
        action = "<cmd>lua require('cmp').complete()<cr>";
      }
    ];

    ic = [
      { key = "<c-BS>"; action = "<c-w>"; }
      { key = "<c-h>"; action = "<c-w>"; }
    ];
  };
in {
  programs.nixvim.keymaps =
    map (keymap: keymap // { mode = [ "i" ]; }) keymaps.i ++
    map (keymap: keymap // { mode = [ "i" "c" ]; }) keymaps.ic
  ;
}
