require('plugs')
require('options')
require('lsp_zero_config')
require('treesitter')
require('plugins/lualine')
-- require('plugins/nvim_ts_autotag')
require('plugins/treesitter-tailwind')
require('plugins/nerdtree')
require('remap')



function ColorMyPencils(color)
  color = color or 'gruvbox'
  vim.cmd.colorscheme(color)
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


ColorMyPencils()
