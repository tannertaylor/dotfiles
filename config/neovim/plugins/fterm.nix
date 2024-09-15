{ pkgs, ... }: with pkgs; {
  package = vimPlugins.FTerm-nvim;

  # TODO: Move edit_multiple_files to common utility file.
  setup = ''
    tt.edit_multiple_files = function(filesStr)
      local files = vim.split(filesStr, '~', { trimempty = true })
      for _, file in ipairs(files) do
        vim.cmd('edit ' .. file)
      end
    end

    local fterm = require("FTerm")
    tt.term = { }

    tt.term.terminals = {
      lazygit = fterm:new({
        cmd = "lazygit"
      }),
    }

    tt.term.scratches = { }

    tt.term.close_all = function()
      fterm.close()

      for _, term in pairs(tt.term.terminals) do
        term:close()
      end

      for name, term in pairs(tt.term.scratches) do
        term:close()
        tt.term.scratches[name] = nil
      end
    end

    tt.term.create_scratch = function(name, config)
      assert(name ~= nil, "scratch terminal name must be set")

      local previous_on_exit_func = config.on_exit
      config.on_exit = function()
        if previous_on_exit_func ~= nil then
          previous_on_exit_func()
        end

        tt.term.scratches[name] = nil
      end

      local term = fterm:new(config)
      tt.term.scratches[name] = term
      term:open()
    end

    tt.term.open_yazi = function()
      tt.term.create_scratch("yazi", {
        cmd = { 'yazi', vim.fn.expand('%:p:h') },
        env = { ['NVIM_REMOTE'] = vim.v.servername }
      })
    end
  '';
}

