{ pkgs, lib, ... }: {
  programs.yazi = {
    enable = true;

    settings = {
      manager = {
        show_hidden = true;
      };

      opener = {
        edit = [
          { run = let script = "nvim-yazi-wrapper"; in "${lib.attrsets.getBin pkgs.writeShellScriptBin script ''
            if [ -z $NVIM_REMOTE ]; then
              nvim "$@"
            else
              NVIM_FILES=$(echo "$@" | tr ' ' '~')
              nvim --server "$NVIM_REMOTE" --remote-send "<c-\><c-n>:close! | :lua vim.edit_multiple_files('$NVIM_FILES')<cr>"
            fi
          ''}/bin/${script} $@"; desc = "Neovim"; block = true; }
        ];
      };

      open = {
        rules = [
          { mime = "*"; use = "edit";  }
        ];
      };
    };
  };
}
