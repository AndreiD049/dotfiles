local opt = vim.opt;

local M = {}

function M.changeFont(amount)
    local font = opt.guifont['_value']
    local start, _, size = string.find(font, ":h(%d+)")
    opt.guifont = string.sub(font, 1, start) .. "h" .. (size + amount)
end

function M.toggleThemes(themes)
    local current = vim.g.colors_name
    local inverse_index = {}
    for k, v in pairs(themes) do
        inverse_index[v] = k
    end
    local next_index = 1;
    if (inverse_index[current] ~= nil) then
        next_index = math.max((inverse_index[current] + 1) % (#themes + 1), 1)
    end
    print("Setting colorscheme to " .. themes[next_index])
    vim.g.colors_name = themes[next_index]
    vim.cmd("colorscheme " .. themes[next_index])
end

return M

