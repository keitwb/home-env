execute pathogen#infect()

set nocompatible

syntax on
colorscheme herald
set t_Co=256
set background=dark

set cursorline
" set cursorcolumn

set cmdheight=1
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

set wrap

runtime! ftplugin/man.vim

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" autocmd BufNewFile,BufRead *.py compiler python

" show line numbers
set number

" show cursor position
set ruler

" indentation settings
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start
" set cindent

filetype plugin on
filetype plugin indent on

" Turn on syntax completion
set ofu=syntaxcomplete#Complete

" show matching brackets
set showmatch

" don't highlight search matches
set nohls

" set the console width after which to create a newline
set textwidth=79
" don't break a line already longer than textwidth
set formatoptions+=lv

" make the screen move before the cursor reaches the bottom
set scrolloff=3

" search as you type
set incsearch

" search settings
set ignorecase
set smartcase

" automatically save when certain commands are called
set autowrite

" show imcomplete commands in bottom right
set showcmd

" automatically save and load views on startup/exit
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" Custom Key Mappings

" map arrow keys to nothing to avoid temptation
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>

" refresh the syntax highlighting in the whole file
noremap <Leader>ss :syntax sync fromstart<CR>
" insert just one character before cursor (TODO: doesn't work at beginning of line)
nnoremap <Space> yhpr
" insert a line below cursor without going into insert mode
nnoremap <CR> o<Esc>
" split line after cursor (complement of Shift-j)
nnoremap <C-j> i<CR><Esc>^

nnoremap <Leader>rc :e ~/.vimrc<CR>
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>np :set nopaste<CR>
nnoremap <Leader>s :set spell<CR>
nnoremap <Leader>ns :set nospell<CR>

" vertically expand current window
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Search selection
vnoremap // y/<C-R>"<CR>
" Toggle the file explorer
nnoremap <silent> <F5> :NERDTreeToggle<CR>
" Make windows all equal size
"nnoremap <F9> =
" Open NERDTree in the dir of the current file
nnoremap <F10> :NERDTreeFind<CR>
" Cycle through open windows
nnoremap <F12> 
" Remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
nnoremap <Leader>hs :set hlsearch!<CR>

let g:SuperTabDefaultCompletionType='context'

" Set filetypes for salesforce.com
au BufNewFile,BufRead *.page set filetype=html
au BufNewFile,BufRead *.component set filetype=html
au BufNewFile,BufRead *.resource set filetype=javascript
au BufNewFile,BufRead *.html.us set filetype=html

let g:ftplugin_sql_omni_key = '<C-B>'

" JavaImp settings
let g:JavaImpPaths = "/home/benkeith/code/android/android-sdk-linux_x86/platforms/android-8:/home/benkeith/code/projects/memoria/android/src:/home/benkeith/code/projects/memoria/android/gen:/home/benkeith/code/projects/memoria/android/libs:/home/benkeith/code/projects/memoria/android/tests/src"
" let g:JavaImpPaths = "/home/benkeith/.vim/javaimp/dirlinks"
let g:JavaImpPathSep = ":"
let g:JavaImpDataDir = $HOME . "/.vim/javaimp"
let g:JavaImpDocPaths = "/home/benkeith/code/android/android-sdk-linux_x86/docs/reference/"
let g:JavaImpDocViewer = "firefox"
let g:JavaImpSortPkgSep = 0

"make ant work with the :make command
set makeprg=ant\ -quiet\ -emacs\ -find\ build.xml

let g:ExecPerl_perlpath = "/usr/bin/perl"

" swap file location
let s:tmpdir = $HOME . '/tmp/vim/'
if !isdirectory(s:tmpdir)
  call mkdir(s:tmpdir)
endif
execute 'set directory=' . s:tmpdir

" Silence an error when vim does not have gui support
let g:CSApprox_verbose_level = 0

" Makes NerdTree close after you open a file
let NERDTreeQuitOnOpen = 1

" Enable python omni complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

let g:template_dir = "/home/benkeith/.vim/templates"
let NERDTreeIgnore = ['\.pyc$']
set nospell

" Highlight trailing whitespace in red
match ErrorMsg '\s\+$'

set nojoinspaces
