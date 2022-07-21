local snippets = {
    s('state', fmt("const [{}, set{}] = React.useState({});{}", {
        i(1, "state"),
        f(function (args)
            return (args[1][1]:gsub("^%l", string.upper))
        end, {1}),
        i(2, "value"),
        i(0)
    })),
    s("effect", fmt("React.useEffect(() => {{\n\t{func}\n}}, [{deps}]);", {
        deps = i(1),
        func = i(2),
    })),
    s("rfc", fmt([[
        const {name}: React.FC = () => {{
            return (<div>{after}</div>);
        }};]],
        {
            name = i(1, "component"),
            after = i(0)
        }
    )),
}

local autosnippets = {}

return snippets, autosnippets
