local common = require 'myconf.lang.common'

vim.opt.spelllang = 'en_us'
vim.opt.spell = false
vim.o.smartindent = false;

require'ltex-ls'.setup{
  use_spellfile = false,
  on_attach = common.on_attach,
  settings = {
		ltex = {
			language = "en-US",
      enabled = { "markdown", },
      dictionary = (function()
        -- For dictionary, search for files in the runtime to have
        -- and include them as externals the format for them is
        -- dict/{LANG}.txt
        --
        -- Also add dict/default.txt to all of them
        local files = {}
        for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
          local lang = vim.fn.fnamemodify(file, ":t:r")
          local fullpath = vim.fs.normalize(file, ":p")
          files[lang] = { ":" .. fullpath }
        end

        if files.default then
          for lang, _ in pairs(files) do
            if lang ~= "default" then
              vim.list_extend(files[lang], files.default)
            end
          end
          files.default = nil
        end
        return files
      end)(),
		},
	},
}
