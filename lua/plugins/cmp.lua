local cmp = require('cmp')

cmp.setup({
  preselect = 'none',
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  })
})
