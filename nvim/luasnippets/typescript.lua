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
    s("switch", fmt([[
    switch ({cons}) {{
        case {option}:
            {body}
            break;
        default:
            {default}
            break;
    }};]], {
        cons = i(1, "constant"),
        option = i(2, "option"),
        body = i(3, "body"),
        default = i(4, "default")
    })),
}

local autosnippets = {}

return snippets, autosnippets
