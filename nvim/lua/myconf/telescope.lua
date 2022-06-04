local tb = require("telescope.builtin")

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', ';', function() tb.find_files{hidden=true} end)
vim.keymap.set('n', '<leader>fg', function() tb.live_grep() end)
vim.keymap.set('n', '<leader>m', function() tb.buffers({ sort_lastused=true }) end)
vim.keymap.set('n', '<leader>fh', function() tb.help_tags() end)
vim.keymap.set('n', '<leader>ft', function() tb.treesitter() end)
