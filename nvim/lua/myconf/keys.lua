-- Custom Key Mappings

local key = vim.api.nvim_set_keymap

local n = 'n'
local noremap = { noremap = true }

-- refresh the syntax highlighting in the whole file
key( n, '<Leader>ss', ':syntax sync fromstart<CR>', noremap )
-- insert just one character before cursor (TODO: doesn't work at beginning of line)
key( n, '<Space>', 'yhpr', noremap )
---- split line after cursor (complement of Shift-j)
key(n, '<C-j>', 'i<CR><Esc>^', noremap )

key(n, '<Leader>rc', ':e ~/.vimrc<CR>', noremap )
key(n, '<Leader>p', ':set paste<CR>', noremap )
key(n, '<Leader>np', ':set nopaste<CR>', noremap )
key(n, '<Leader>s', ':set spell<CR>', noremap )
key(n, '<Leader>ns', ':set nospell<CR>', noremap )

-- vertically expand current window
if vim.fn.bufwinnr(1) then
  key('n', '+', '<C-W>+', {})
  key('n', '-', '<C-W>-', {})
end

-- Make Ctrl+c behave the same as Escape key
key('i', '<C-c>', '<Esc>', noremap)
-- Toggle the file explorer
key(n, '<silent> <F5>', ':NERDTreeToggle<CR>', noremap)

-- Open NERDTree in the dir of the current file
key(n, '<F10>', ':NERDTreeFind<CR>', noremap)
-- Cycle through open windows
key(n, '<F12>', '', noremap)
-- Remove trailing whitespace
key(n, '<Leader>rtw', [[:%s/\s\+$//e<CR>]], noremap)

-- toggle highlighting of last search results
key(n, '<Leader>hs', ':set hlsearch!<CR>', noremap )

-- Find files using Telescope command-line sugar.
key(n, ';', '<cmd>Telescope find_files hidden=true<cr>', noremap )
key(n, '<leader>fg', '<cmd>Telescope live_grep<cr>', noremap)
key(n, '<leader>m', '<cmd>:lua require("telescope.builtin").buffers({ sort_lastused=true })<cr>', noremap)
key(n, '<leader>fh', '<cmd>Telescope help_tags<cr>', noremap)
