local o = vim.o

o.syntax = "on"
o.termguicolors = true
vim.cmd [[ colorscheme monokai_pro ]]
o.background = "dark"

o.hidden = true

o.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
o.shortmess = "filnxtToOFc"

o.completeopt = "menu,menuone,noselect"

o.cursorline = true

o.cmdheight = 1
o.laststatus = 2
o.statusline = [[[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P]]

o.wrap = true
o.winfixwidth = true

-- show line numbers
o.number = true
o.relativenumber = true

-- show cursor position
o.ruler = true

-- indentation settings
o.autoindent = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.backspace = "indent,eol,start"

o.signcolumn = "number"

-- Setting this to yes stops vim from creating a new inode when saving a file
o.backupcopy = "yes"

vim.cmd "filetype plugin on"
vim.cmd "filetype plugin indent on"

-- set the console width after which to create a newline
o.textwidth = 100
-- don't break a line already longer than textwidth
o.formatoptions = "tcqjlv"

-- make the screen move before the cursor reaches the bottom
o.scrolloff = 3

-- Avoid unnecessary redraws
o.lazyredraw = true

-- search settings
-- search as you type
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- Make things unfolded by default (up to 10 levels)
o.foldlevelstart = 10
o.foldnestmax = 10

-- automatically save when certain commands are called
o.autowrite = true

-- show imcomplete commands in bottom right
o.showcmd = true

-- don't highlight search matches
o.hls = false

-- swap file location
--local tmpdir = os.getenv("HOME") .. '/tmp/vim/'
--if !isdirectory(s:tmpdir)
--  call mkdir(s:tmpdir)
--endif
--execute 'set directory=' . s:tmpdir
