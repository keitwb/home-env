local common = require 'myconf.lang.common'

vim.cmd[[compiler tsc]];
vim.opt_local.makeprg="npx tsc --noEmit";

require'lspconfig'.tsserver.setup{log_level = "debug", on_attach = common.on_attach} -- npm install -g typescript-language-server typescript

