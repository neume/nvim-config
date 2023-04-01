vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use 'christoomey/vim-tmux-navigator'
  use { 'preservim/nerdtree', on = 'NERDTreeToggle' }
  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }

  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'vim-ruby/vim-ruby'
  use 'tpope/vim-rails'
  use 'mileszs/ack.vim'
  use 'tpope/vim-commentary'
  use 'dyng/ctrlsf.vim'
  use 'itmammoth/run-rspec.vim'
  use 'morhetz/gruvbox'
  use 'rose-pine/neovim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'mhinz/vim-startify'
  use 'github/copilot.vim'
  use 'mbbill/undotree'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      {
        'williamboman/mason.nvim',
        run = ":MasonUpdate"
      },
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    },
    config = function()
    end
  }
  use('nvim-treesitter/nvim-treesitter', {
    run = ':TSUpdate'
  })
  use('nvim-treesitter/playground')
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- use 'windwp/nvim-autopairs'
  -- use 'windwp/nvim-ts-autotag'
  use 'airblade/vim-rooter'
  use { 'akinsho/nvim-bufferline.lua', tag = 'v3.*', requires = 'kyazdani42/nvim-web-devicons' }
  use {
    'nvim-neotest/neotest',
    requires = {
      'olimorris/neotest-rspec',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-rspec')({
            rspec_cmd = function()
              return vim.tbl_flatten({
                'bundle',
                'exec',
                'rspec',
              })
            end
          }),
        }
      })
    end
  }
end)
