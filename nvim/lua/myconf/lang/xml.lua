local common = require 'myconf.lang.common'

require'lspconfig'.lemminx.setup{
  on_attach = common.on_attach,
  settings = {
    xml = {
      validation = {
        resolveExternalEntities = true,
      },
    },
  },
} 
