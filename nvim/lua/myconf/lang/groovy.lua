local common = require 'myconf.lang.common'

require'lspconfig'.groovyls.setup{
    cmd = { "java", "-jar", "/usr/local/lib/groovy-language-server-all.jar" },
} -- Needs https://github.com/GroovyLanguageServer/groovy-language-server installed
