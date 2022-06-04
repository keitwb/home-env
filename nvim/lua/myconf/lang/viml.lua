local common = require 'myconf.lang.common'

require'lspconfig'.vimls.setup{on_attach = common.on_attach} -- npm install -g vim-language-server
