{ pkgs, ... }: {
  dap = {
    enable = true;

    adapters = {
      executables = {
        coreclr = {
          command = "${pkgs.netcoredbg}";
          args = [ "--interpreter=vscode" ];
        };
      };
    };

    configurations = {
      cs = [
        {
          name = "launch - netcoredbg";
          type = "coreclr";
          request = "launch";
          program = {
            __raw = ''function()
              return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
            end'';
          };
        }
      ];
    };
  };
}
