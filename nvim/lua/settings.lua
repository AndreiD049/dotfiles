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
opt.shell = vim.fn.has('win32') == 1 and 'powershell' or 'zsh'
if vim.fn.has('win32') > 0 then
    opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    opt.shellquote = ''
    opt.shellxquote = ''
end
opt.foldlevelstart = 20
opt.foldmethod = 'syntax'
opt.foldlevelstart = 20
opt.wrap = false
opt.equalalways = false

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
-- Neoformat
------------------------------
g.neoformat_verbose = 1
g.neoformat_try_node_exe = 1

------------------------------
-- Auto closing tags
------------------------------
g.closetag_filenames = '*.html,*.xml,*.jsx,*.tsx'
g.closetag_xhtml_filetypes = 'xhtml,jsx'
cmd([[
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
]])
g.closetag_shortcut = '>'
g.closetag_close_shortcut = '<Leader>>'


------------------------------
-- Neovide GUI
------------------------------
opt.guifont='FiraMono Nerd Font Mono:h12'
g.neovide_refresh_rate = 60
g.neovide_remember_window_size = true
------------------------------
-- Colors
------------------------------

opt.termguicolors = true
cmd('colorscheme dracula')

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
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
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

