local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

vim.g.mapleader = ';'

map('n', '<C-a>', [[:Telescope find_files<CR>]], default_opts)
map('n', '<C-f>', [[:Telescope live_grep<CR>]], default_opts)
map('n', '<C-p>', [[:Telescope buffers<CR>]], default_opts)

map('n', 'gd', [[ <cmd>lua vim.lsp.buf.definition()<cr> ]], default_opts)
map('n', 'gtd', [[ <cmd>lua vim.lsp.buf.type_definition()<cr> ]], default_opts)
map('n', 'gD', [[ <cmd>lua vim.lsp.buf.declaration()<cr> ]], default_opts)
map('n', 'gr', [[ <cmd>lua vim.lsp.buf.references()<cr> ]], default_opts)
map('n', 'gi', [[ <cmd>lua vim.lsp.buf.implementation()<cr> ]], default_opts)
map('n', 'gh', [[ <cmd>lua vim.lsp.buf.hover()<cr> ]], default_opts)
map('n', '<Leader>.', [[ <cmd>lua vim.lsp.buf.code_action()<cr> ]], default_opts)
map('n', '<C-k>', [[ <cmd>lua vim.lsp.buf.signature_help()<cr> ]], default_opts)
map('n', '<C-l>', [[ <cmd>lua vim.diagnostic.goto_next()<cr> ]], default_opts)
map('n', '<C-h>', [[ <cmd>lua vim.diagnostic.goto_prev()<cr> ]], default_opts)
map('', '<Leader><Leader>f', "<cmd>lua require'hop'.hint_char1()<cr>", {})
map('', '<Leader><Leader>w', "<cmd>lua require'hop'.hint_words()<cr>", {})
map('', '<Leader><Leader>/', "<cmd>lua require'hop'.hint_patterns()<cr>", {})

map('n', '<Leader>q', ':ccl<CR>', default_opts)

map('t', '<Esc>', [[<C-\><C-N>]], default_opts)

-- File manager

map('n', '<F6>', [[:NvimTreeToggle<cr>]], default_opts)

-- Folding
map('n', '<S-Left>', [[za]], default_opts)

-- Formatting
map('n', '<Leader>p', [[<cmd>silent Neoformat prettier<cr><cr>]], default_opts)

-- Set winfixheight for every new window
-- vim.cmd([[autocmd WinNew * set noequalalways]])

