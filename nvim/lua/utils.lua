local opt = vim.opt;

local M = {}

function M.changeFont(amount)
    local font = opt.guifont['_value']
    local start, _, size = string.find(font, ":h(%d+)")
    opt.guifont = string.sub(font, 1, start) .. "h" .. (size + amount)
end

return M

