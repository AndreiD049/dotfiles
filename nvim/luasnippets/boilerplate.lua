local snippets = {
    s('Example', fmt("const [{}, set{}] = React.useState({});{}", {
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
