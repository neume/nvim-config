-- NerdTree mappings
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", ":NERDTreeFind<CR>", {noremap = true})
vim.keymap.set("n", "<leader>nt", ":NERDTree<CR>", {noremap = true})

vim.keymap.set("n", "<leader>f", ":FZF<CR>", {noremap = true})

vim.keymap.set('n', '<leader>vc', ':e ~/.config/nvim/init.lua<CR>', {noremap = true})

-- Git mappings
vim.keymap.set('n', '<leader>gs', ':Git<CR>', {noremap = true})
vim.keymap.set('n', '<leader>gc', ':Gcommit<CR>', {noremap = true})

-- Tab navigation
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', {noremap = true})
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', {noremap = true})

-- CMP mappings
-- vim.keymap.set('i', '<C-Space>', '<Plug>(cmp-complete)', { silent = true })
-- vim.keymap.set('i', '<CR>', 'pumvisible() ? "<C-y>" : "<CR>"', { expr = true, noremap = true, silent = true })

-- Create new tab with current file and jump to it
vim.keymap.set('n', '<leader>z', ':tabnew %<CR><C-o>', {noremap = true})

-- Replace selected text
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Run all tests
vim.keymap.set('n', '<leader>a', ':RunSpecAll<CR>', { noremap = true })
vim.keymap.set('n', '<leader>r', ':RunSpec<CR>', { noremap = true })
vim.keymap.set('n', '<leader>l', ':RunSpecLine<CR>', { noremap = true })
vim.keymap.set('n', '<leader>e', ':RunSpecLastRun<CR>', { noremap = true })
vim.keymap.set('n', '<leader>cr', ':RunSpecCloseResult<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ll', ':set list<CR>', { noremap = true })
vim.keymap.set('n', '<leader>nl', ':set nolist<CR>', { noremap = true })

-- Copilot config and mappings
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Telescope mappings
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({
    search = vim.fn.input('Grep For > ')
  })
end)
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set("n", "<leader>pf", ":Telescope find_files<CR>", {noremap = true})
vim.keymap.set("n", "<leader>pl", ":Telescope live_grep<CR>", {noremap = true})


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {noremap = true})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {noremap = true})

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {noremap = true})
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", {noremap = true})

-- Toogle visibility of tailwind class names
local function toggle_conceal()
  if vim.opt.conceallevel:get() == 0 then
    vim.opt.conceallevel = 2
  else
    vim.opt.conceallevel = 0
  end
end

vim.keymap.set("n", "<leader>tc", toggle_conceal, {noremap = true})  

-- Neotest runner
local function run_tests()
  local test = require('neotest')
  test.run.run()
  test.summary.open()
end

vim.keymap.set("n", "<leader>tr", run_tests, {noremap = true})  

-- Set nvim coverage
vim.keymap.set("n", "<leader>ci", ":Coverage<CR>", {noremap = true})
vim.keymap.set("n", "<leader>cs", ":CoverageSummary<CR>", {noremap = true})
vim.keymap.set("n", "<leader>ct", ":CoverageToggle<CR>", {noremap = true})
vim.keymap.set("n", "<leader>cv", ":CoverageView<CR>", {noremap = true})
