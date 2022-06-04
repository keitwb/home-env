local common = require 'myconf.lang.common'

require'lspconfig'.bashls.setup{on_attach = common.on_attach} -- npm install -g bash-language-server
