local common = require 'myconf.lang.common'

local on_attach = function(client, buffer)
  client.server_capabilities.document_formatting = true;
  common.on_attach(client, buffer);
end

require'lspconfig'.yamlls.setup{
  on_attach = on_attach,
  settings = {
    yaml = {
      format = {
        enabled = true,
      },
      validate = false,
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.26.1-standalone-strict/all.json"] = "/*.k8s.yaml",
      }
    }
  }
}
