------------------------------
-- Snippets
------------------------------
local ls = require'luasnip'

ls.config.set_config {
    history = true,

    updateevents = "TextChanged,TextChangedI",

    snip_env = {
        ls = require'luasnip',
        parse = ls.parser.parse_snippet,
        fmt = require('luasnip.extras.fmt').fmt,
        rep = require('luasnip.extras').rep,
        s = ls.snippet,
        t = ls.text_node,
        i = ls.insert_node,
        f = ls.function_node,
        c = ls.choice_node,
    }
}

-- cleanup the snippets before reloading, this is actually needed for the contents to change
ls.cleanup()

ls.filetype_set("typescript", { "typescript", "typescriptreact" })
require('luasnip.loaders.from_lua').lazy_load({ paths = "./luasnippets" })
require('luasnip.loaders.from_vscode').lazy_load({ paths = "./snippets" })
