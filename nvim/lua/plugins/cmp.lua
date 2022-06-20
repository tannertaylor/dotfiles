local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<tab>'] = cmp.mapping.select_next_item(),
    ['<s-tab>'] = cmp.mapping.select_prev_item(),
    ['<cr>'] = cmp.mapping.confirm()
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' }
  })
})
