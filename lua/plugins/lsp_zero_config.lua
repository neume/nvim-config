local lsp = require('lsp-zero')
lsp.preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

lsp.setup_nvim_cmp({
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
})


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
