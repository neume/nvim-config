-- Set a flag to indicate that input is being read from stdin
vim.cmd('autocmd StdinReadPre * let s:std_in=1')

-- Run these commands when Vim enters the editor
vim.cmd([[
  autocmd VimEnter *
          \ if !argc()
          \|   Startify
          \|   NERDTree
          \|   wincmd w
]])
