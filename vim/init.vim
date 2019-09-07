syntax on

colorscheme herald
set background=dark

set cursorline
set cursorcolumn

set cmdheight=1
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

set wrap

" Make Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" show line numbers
set number

" show cursor position
set ruler

" indentation settings
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start

" Setting this to yes stops vim from creating a new inode when saving a file
set backupcopy=yes

filetype plugin on
filetype plugin indent on

" set the console width after which to create a newline
set textwidth=100
" don't break a line already longer than textwidth
set formatoptions+=lv

" make the screen move before the cursor reaches the bottom
set scrolloff=3

" Avoid unnecessary redraws
set lazyredraw

" search settings
" search as you type
set incsearch
set ignorecase
set smartcase

" Make things unfolded by default (up to 10 levels)
set foldlevelstart=10
set foldnestmax=10

" automatically save when certain commands are called
set autowrite

" show imcomplete commands in bottom right
set showcmd

" Custom Key Mappings

" map arrow keys to nothing to avoid temptation
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>

noremap <Leader>m :FZFMru<CR>
" refresh the syntax highlighting in the whole file
noremap <Leader>ss :syntax sync fromstart<CR>
" insert just one character before cursor (TODO: doesn't work at beginning of line)
nnoremap <Space> yhpr
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

nnoremap ; :Files<CR>

" Make Ctrl+c behave the same as Escape key
inoremap <C-c> <Esc>
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

" don't highlight search matches
set nohls
" toggle highlighting of last search results
nnoremap <Leader>hs :set hlsearch!<CR>

" swap file location
let s:tmpdir = $HOME . '/tmp/vim/'
if !isdirectory(s:tmpdir)
  call mkdir(s:tmpdir)
endif
execute 'set directory=' . s:tmpdir

" Makes NerdTree close after you open a file
let NERDTreeQuitOnOpen = 1
" Don't show these files in NerdTree
let NERDTreeIgnore = ['\.pyc$']

set nospell
autocmd FileType * setlocal nospell

" Highlight trailing whitespace in red
match ErrorMsg '\s\+$'

set nojoinspaces

" ALE settings
"let g:ale_use_global_executables = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_pattern_options = { '\.gen.ts$': {'ale_fixers': []}, '_gen.py': {'ale_fixers': []} }

set clipboard+=unnamedplus
