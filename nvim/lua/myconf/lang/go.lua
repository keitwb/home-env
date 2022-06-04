local common = require 'myconf.lang.common'

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local util = require 'lspconfig/util'
local lastRootPath = nil
local gopath = io.popen("go env GOPATH"):read("*a")
if gopath == nil then
  gopath = ""
end
local gopathmod = gopath ..'/pkg/mod'

require'lspconfig'.gopls.setup{
  root_dir = function(fname)
    local fullpath = vim.fn.expand(fname, ':p')
    if string.find(fullpath, gopathmod) and lastRootPath ~= nil then
        return lastRootPath
    end
    lastRootPath = util.root_pattern("go.mod", ".git")(fname)
    return lastRootPath
  end,
  on_attach = common.on_attach,
  capabilities = capabilities
}
