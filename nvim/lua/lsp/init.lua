local lua_config = require('lsp.sumneko_lua')

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local file_type = args.match
    local buffer_number = args.buffer

    local language_servers = { }

    local get_client_id = function(language_id, config)
      if (language_servers[language_id] == nil)
      then
        language_servers[language_id] = vim.lsp.start_client(config)
      end

      return language_servers[language_id]
    end

    if (file_type == 'lua')
    then
      local client_id = get_client_id('lua', lua_config)
      vim.lsp.buf_attach_client(buffer_number, client_id)
    end
  end
})
