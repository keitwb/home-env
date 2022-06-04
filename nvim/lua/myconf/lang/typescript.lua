local common = require 'myconf.lang.common'

require'lspconfig'.tsserver.setup{log_level = "debug", on_attach = common.on_attach} -- npm install -g typescript-language-server typescript

