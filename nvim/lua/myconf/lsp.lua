local nvim_lsp = require('lspconfig')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- Set autocommands conditional on server_capabilities
  --if client.resolved_capabilities.document_highlight then
  --  vim.api.nvim_exec([[
  --    hi LspReferenceRead cterm=bold ctermbg=red gui=underline
  --    hi LspReferenceText cterm=bold ctermbg=red gui=underline
  --    hi LspReferenceWrite cterm=bold ctermbg=red gui=underline
  --    augroup lsp_document_highlight
  --      autocmd! * <buffer>
  --      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --    augroup END
  --  ]], false)
  --end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local util = require 'lspconfig/util'
local lastRootPath = nil
local gopath = io.popen("go env GOPATH"):read("*a")
if gopath == nil then
  gopath = ""
end
local gopathmod = gopath..'/pkg/mod'

require'lspconfig'.gopls.setup{
  root_dir = function(fname)
    local fullpath = vim.fn.expand(fname, ':p')
    if string.find(fullpath, gopathmod) and lastRootPath ~= nil then
        return lastRootPath
    end
    lastRootPath = util.root_pattern("go.mod", ".git")(fname)
    return lastRootPath
  end,
  on_attach = on_attach,
  capabilities = capabilities
}
require'lspconfig'.bashls.setup{on_attach = on_attach} -- npm install -g bash-language-server
require'lspconfig'.jsonls.setup{on_attach = on_attach} -- npm i -g vscode-langservers-extracted

require'lspconfig'.sumneko_lua.setup{
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
} -- pacman -Sy lua-language-server

require'lspconfig'.tsserver.setup{log_level = "debug", on_attach = on_attach} -- npm install -g typescript-language-server typescript
require'lspconfig'.vimls.setup{on_attach = on_attach} -- npm install -g vim-language-server
-- require'lspconfig'.yamlls.setup{on_attach = on_attach} -- npm install -g yaml-language-server
-- require'lspconfig'.pyright.setup{on_attach = on_attach} -- npm install -g pyright

local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

require'lspconfig'.pylsp.setup{ 
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        pylsp_mypy = {
          enabled = true,
          live_mode = true,
          strict = false,
        },
        pylsp_black = { enabled = true },
        pyls_isort = { enabled = true },
      }
    }
  },
} -- pip install python-lsp-server

-- require'lspconfig'.jedi_language_server.setup{on_attach = on_attach} -- pipx install jedi-language-server
require'lspconfig'.cssls.setup{on_attach = on_attach}  -- npm install -g vscode-css-languageserver-bin
require'lspconfig'.bashls.setup{on_attach = on_attach}
require'lspconfig'.lemminx.setup{
  on_attach = on_attach,
  settings = {
    xml = {
      validation = {
        resolveExternalEntities = true,
      },
    },
  },
} 
require'lspconfig'.tailwindcss.setup{on_attach = on_attach} -- npm install -g @tailwindcss/language-server
require'lspconfig'.groovyls.setup{
    cmd = { "java", "-jar", "/usr/local/lib/groovy-language-server-all.jar" },
} -- Needs https://github.com/GroovyLanguageServer/groovy-language-server installed
