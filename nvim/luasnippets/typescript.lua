local snippets = {
    s('fexpr', fmt([[
    {export}const {name}{funcType} = ({props}) => {{
        {body}
    }};]], {
        export = c(1, {
            t("export "),
            t("")
        }),
        name = i(2, "name"),
        funcType = c(3, {
            i(1, ": type"),
            t("")
        }),
        props = i(4),
        body = i(5)
    })),
}

local autosnippets = {}

return snippets, autosnippets
