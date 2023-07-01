local common = require 'myconf.lang.common'

require'lspconfig'.cssls.setup{on_attach = common.on_attach}  -- npm install -g vscode-css-languageserver-bin
--require'lspconfig'.tailwindcss.setup{on_attach = common.on_attach} -- npm install -g @tailwindcss/language-server
