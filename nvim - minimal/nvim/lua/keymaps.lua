local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

vim.g.mapleader = ';'

map('n', '<Leader>q', ':ccl<CR>', default_opts)

map('t', '<Esc>', "<C-\\><C-N>", default_opts)

-- Folding
map('n', '<S-Left>', "za", default_opts)
