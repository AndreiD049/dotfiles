local ls = require'luasnip'
local parse = ls.parser.parse_snippet
local fmt = require('luasnip.extras.fmt').fmt;
local rep = require('luasnip.extras').rep;
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

local snippets = {
    s('state', fmt("const [{}, set{}] = React.useState({});{}", {
        i(1, "state"),
        f(function (args)
            return (args[1][1]:gsub("^%l", string.upper))
        end, {1}),
        i(2, "value"),
        i(0)
    }))
}

local autosnippets = {}

return snippets, autosnippets
