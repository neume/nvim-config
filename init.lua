require('plugs')
require('options')
require('plugins/lsp_zero_config')
require('plugins/treesitter')
require('plugins/lualine')
-- require('plugins/nvim_ts_autotag')
require('plugins/treesitter-tailwind')
require('plugins/nerdtree')
require('plugins/nvim-coverage')
require('plugins/cmp')

require('remap')

function SetupColors(color)
  color = color or 'gruvbox'
  vim.cmd.colorscheme(color)
end

function HideMyBackground()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetupColors('vscode')
HideMyBackground()
