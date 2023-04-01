local opt = vim.opt
opt.clipboard = "unnamed"
opt.scrolloff = 5
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2

opt.cursorline = true
opt.cursorcolumn = true
opt.wrap = true
opt.colorcolumn = '120'
opt.showtabline = 2

opt.number = true 
opt.relativenumber = true

opt.sidescrolloff = 8

vim.g.NERDTreeMapJumpPrevSibling = ""
vim.g.NERDTreeMapJumpNextSibling = ""

-- vim.g.run_rspec_command = "bundle exec rspec"

vim.g.run_rspec_bin = "bundle exec rspec"

opt.backspace = {'indent', 'eol', 'start'}
opt.history = 500
opt.ruler = true
opt.showcmd = true
opt.wildmenu = true
opt.ttimeout = true
opt.ttimeoutlen = 100
opt.display = 'truncate'
opt.fillchars:append('stl', '─')
opt.laststatus = 3

-- sets nowrap
opt.wrap = false


