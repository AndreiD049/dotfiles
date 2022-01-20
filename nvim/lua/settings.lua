local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

------------------------------
-- Main
------------------------------

opt.cursorline = true		-- highlight cursor
opt.number = true		-- show line numbers
opt.relativenumber = true	-- show relative numbering
opt.undofile = true 		-- keep undo actions in a separate file
opt.splitright = true		-- split to the right
opt.splitbelow = true		-- split vertical to the bottom
opt.mouse = 'nvi'
opt.clipboard = 'unnamedplus'
opt.shell = 'powershell'

------------------------------
-- Lint
------------------------------

g.ale_fixers = { javascript= { 'eslint' } }
g.ale_sign_error = '❌'
g.ale_sign_warning = '⚠️'
g.ale_fix_on_save = 1
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 0

------------------------------
-- Neovide GUI
------------------------------
opt.guifont='FuraMono Nerd Font Mono:h11'
g.neovide_refresh_rate = 60
g.neovide_remember_window_size = true
------------------------------
-- Colors
------------------------------

opt.termguicolors = true
cmd('colorscheme onedark')

------------------------------
-- Tabs and spacing
------------------------------

cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true
opt.shiftwidth = 4              -- use 4 spaces when auto-indenting
opt.tabstop = 4
opt.autoindent = true
opt.smartindent = true

------------------------------
-- LSP Setup
------------------------------

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
    server:setup({})
end)

-- Setup nvim-cmp autocomplete
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'

local luasnip = require('luasnip')

local cmp = require('cmp')
cmp.setup {
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-s>'] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'lausnip' },
        { name = 'path' },
        { name = 'buffer', option = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        } },
    },
    experimental = {
        ghost_text = true
    }
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
