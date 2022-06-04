local common = require 'myconf.lang.common'
local util = require 'lspconfig/util'

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
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

require'lspconfig'.pylsp.setup{
  on_attach = common.on_attach,
  on_new_config = function(new_config, new_root_dir)
    local pypath = get_python_path(new_root_dir)
    new_config.cmd = {pypath, '-m', 'pylsp'}
  end,
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
        pyls_mypy = { enabled = true },
      }
    }
  },
} -- pip install python-lsp-server
