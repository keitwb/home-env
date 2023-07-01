local common = require 'myconf.lang.common'
local lsputil = require 'lspconfig/util'
local pathutil = lsputil.path
local null_ls = require("null-ls")

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return pathutil.join(vim.env.VIRTUAL_ENV, 'bin', 'python3')
  end


  -- Find and use virtualenv or local python script in workspace directory.
  for dir in pathutil.iterate_parents(workspace .. '/.') do
    for _, pattern in ipairs({ '*', '.*' }) do
      local py_script = pathutil.join(dir, "python")
      if pathutil.is_file(py_script) then
        return py_script
      end

      local match = vim.fn.glob(pathutil.join(dir, pattern, 'pyvenv.cfg'))
      if match ~= '' then
        return pathutil.join(pathutil.dirname(match), 'bin', 'python3')
      end
    end
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3')
end

local function get_python_bin_dir(pypath)
  return pathutil.dirname(vim.fn.system { pypath, '-c', "import sys; print(sys.executable)"})
end

require 'lspconfig'.pyright.setup {
  on_attach = common.on_attach,
  on_new_config = function(new_config, new_root_dir)
    local pypath = get_python_path(new_root_dir)
    new_config.settings.python.pythonPath = pypath
    new_config.settings.python.analysis.extraPaths = pathutil.dirname(get_python_bin_dir(pypath))
    print("Using Python at ".. get_python_bin_dir(pypath))
  end,
  settings = {
    python = {
      analysis = {
        useLibraryCodeForTypes = true,
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
      },
    },
  }
} -- pip install pyright

local function null_ls_python_binary(bin_name)
  return function(params)
    local pypath = get_python_path(pathutil.dirname(params.bufname))
    return pathutil.join(get_python_bin_dir(pypath), bin_name)
  end
end


null_ls.setup({
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git", "pyproject.toml"),
  sources = {
    null_ls.builtins.diagnostics.pycodestyle.with({
      command = null_ls_python_binary("pycodestyle")
    }),
    null_ls.builtins.formatting.black.with({
      command = null_ls_python_binary("black")
    }),
    null_ls.builtins.formatting.isort.with({
      command = null_ls_python_binary("isort")
    }),
  },
})
