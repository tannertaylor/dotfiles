{ ... }: {
  telescope = {
    enable = true;

    extensions.file-browser = {
      enable = true;
      settings.hijack_netrw = true;
    };

    settings.defaults = {
      mappings.i = {
        "<C-j>" = { __raw = "require('telescope.actions').move_selection_next"; };
	"<C-k>" = { __raw = "require('telescope.actions').move_selection_previous"; };
      };
    };
  };
}
