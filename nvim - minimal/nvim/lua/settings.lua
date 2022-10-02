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

opt.smartcase = true
opt.matchpairs:append('=:;')

opt.grepprg="rg --vimgrep --no-heading --smart-case $*";

------------------------------
-- Neovide GUI
------------------------------

opt.guifont='FiraMono Nerd Font Mono:h10'
g.neovide_refresh_rate = 60
g.neovide_remember_window_size = true
------------------------------
-- Colors
------------------------------

opt.termguicolors = true

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
