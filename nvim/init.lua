-- Use lua filetype detection
vim.g.do_filetype_lua = 1
-- Disable filetype.vim detection
vim.g.did_load_filetypes = 0


-- For a fresh instance, run :PaqSync
-- After updating anything in this list run `:PaqInstall`
require 'paq' {
  'phanviet/vim-monokai-pro',
  'sainnhe/everforest',
  'vim-scripts/camelcasemotion',
  'itchyny/lightline.vim',
  'preservim/nerdcommenter',
  'preservim/nerdtree',
  'maxmellon/vim-jsx-pretty',
  'hail2u/vim-css3-syntax',
  'neovim/nvim-lspconfig',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  {'nvim-treesitter/nvim-treesitter', run=function() vim.cmd 'TSUpdate' end },
  'BurntSushi/ripgrep',
  'maralla/gomod.vim',
  'ckipp01/nvim-jenkinsfile-linter',
  'j-hui/fidget.nvim',

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
}

require('myconf.core')
require('myconf.keys')
require('myconf.completion')
require('myconf.lsp')
require('myconf.telescope')

require("luasnip.loaders.from_snipmate").lazy_load()
