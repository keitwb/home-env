local common = require 'myconf.lang.common'

require'lspconfig'.rust_analyzer.setup{log_level = "debug", log_file = "/tmp/rust_analyzer.log", on_attach = common.on_attach}
