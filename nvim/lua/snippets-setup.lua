------------------------------
-- Snippets
------------------------------
local ls = require'luasnip'
local parse = ls.parser.parse_snippet

ls.config.set_config {
    history = true,

    updateevents = "TextChanged,TextChangedI",
}

-- cleanup the snippets before reloading, this is actually needed for the contents to change
ls.cleanup()

require('luasnip.loaders.from_lua').lazy_load({ paths = "./luasnippets" })
require('luasnip.loaders.from_vscode').lazy_load({ paths = "./snippets" })
