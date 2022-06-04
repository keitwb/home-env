local common = require 'myconf.lang.common'

require'lspconfig'.jsonls.setup{on_attach = common.on_attach} -- npm i -g vscode-langservers-extracted
