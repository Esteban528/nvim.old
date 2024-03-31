local fn = vim.fn
local install_path = fn.stdpath('data') .. 'site/pack/packer/start/plugins/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', "https://github.com/wbthomason/packer.nvim",
    install_path })
end

return require('packer').startup(function(use)
  --Ide plugins
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'numToStr/Comment.nvim'


  --Bar
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'

  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons",     -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }


  --Theme
  use 'navarasu/onedark.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  --Telescope
  use "nvim-lua/plenary.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'tribela/vim-transparent'


  --LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'nvimtools/none-ls.nvim'
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
  }
  use({
    "L3MON4D3/LuaSnip",
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    run = "make install_jsregexp"
  })

  -- Multi cursor
end)
