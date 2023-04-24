local common = require 'myconf.lang.common'

require'lspconfig'.terraformls.setup{
  on_attach = common.on_attach
}

