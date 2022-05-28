
call plug#begin(stdpath('data') . '/plugged')

Plug 'phanviet/vim-monokai-pro'
Plug 'vim-scripts/camelcasemotion'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'hail2u/vim-css3-syntax'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'BurntSushi/ripgrep'
Plug 'maralla/gomod.vim'
Plug 'ckipp01/nvim-jenkinsfile-linter'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

lua require('myconf.core')
lua require('myconf.keys')
lua require('myconf.completion')
lua require('myconf.lsp')

" Make Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Makes NerdTree close after you open a file
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1
" Don't show these files in NerdTree
let NERDTreeIgnore = ['\.pyc$']

set nospell
autocmd FileType * setlocal nospell

" Highlight trailing whitespace in red
match ErrorMsg '\s\+$'

set nojoinspaces

let g:lightline = {
      \ 'colorscheme': 'monokai_pro',
      \ }


au BufNewFile,BufRead Jenkinsfile setf groovy
au BufNewFile,BufRead *.view setf svg
" For this to work right, put JENKINS_USER_ID, JENKINS_API_TOKEN, and JENKINS_URL in the
" environment.
autocmd BufWritePost,BufReadPost Jenkinsfile lua require("jenkinsfile_linter").validate()

