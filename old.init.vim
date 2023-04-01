call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.

Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" Plug 'morhetz/gruvbox'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'dyng/ctrlsf.vim'
Plug 'itmammoth/run-rspec.vim'
" Plug 'Mofiqul/vscode.nvim'
Plug 'rose-pine/neovim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mhinz/vim-startify'
Plug 'github/copilot.vim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'mbbill/undotree'

Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

colorscheme rose-pine
set clipboard=unnamed

set scrolloff=5
set tabstop=2
set expandtab
set shiftwidth=2

nnoremap <leader>u :UndotreeToggle<CR>

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTree<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
    " If there are no command line arguments and s:std_in does not exist
    " if argc() == 0 && !exists('s:std_in')
    "     " Open the NERDTree plugin
    "     NERDTree
    "     " :wincmd p<CR>
    " endif

" Nerdtree tmux config
" This allows tmux navigation on nerd tree window
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""


nnoremap <leader>vc :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>vv :Telescope find_files<CR>

" Git mappings
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Gcommit<CR>

nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>z :tabnew %<CR><C-o>


set number relativenumber
set listchars=tab:>-
set listchars+=space:·
augroup numbertoggle
  autocmd!

  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

set cursorline
set cursorcolumn
set wrap
set colorcolumn=120

let g:run_rspec_bin = 'bundle exec rspec'
nnoremap <leader>a :RunSpecAll<CR>
nnoremap <leader>r :RunSpec<CR>
nnoremap <leader>l :RunSpecLine<CR>
nnoremap <leader>e :RunSpecLastRun<CR>
nnoremap <leader>cr :RunSpecCloseResult<CR>
nnoremap <leader>ll :set list<CR>
nnoremap <leader>nl :set nolist<CR>


lua << EOF
  local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
  })

  -- (Optional) Configure lua language server for neovim
  lsp.nvim_workspace()

  lsp.setup()
EOF
lua << EOF

-- -- Lua:
-- -- For dark theme (neovim's default)
-- vim.o.background = 'dark'
-- -- For light theme
-- vim.o.background = 'light'
--
-- local c = require('vscode.colors').get_colors()
-- require('vscode').setup({
--     -- Alternatively set style in setup
--     -- style = 'light'
--
--     -- Enable transparent background
--     transparent = true,
--
--     -- Enable italic comment
--     italic_comments = true,
--
--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = true,
--
--     -- Override colors (see ./lua/vscode/colors.lua)
--     color_overrides = {
--         vscLineNumber = '#FFFFFF',
--     },
--
--     -- Override highlight groups (see ./lua/vscode/theme.lua)
--     group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
--     }
-- })
-- require('vscode').load()
-- require('vscode').load('dark')
--
EOF

lua << EOF
  vim.keymap.set("x", "<leader>p", "\"_dP")
EOF

lua << EOF
  vim.g.copilot_no_tab_map = true
  vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
EOF
