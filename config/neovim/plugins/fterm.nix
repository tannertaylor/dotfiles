{ pkgs, ... }: with pkgs; {
  package = vimPlugins.FTerm-nvim;

  setup = ''
    tt.edit_multiple_files = function(filesStr)
      local files = vim.split(filesStr, '~', { trimempty = true })
      for _, file in ipairs(files) do
        vim.cmd('edit ' .. file)
      end
    end
  '';
}

