local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- color scheme
	use 'joshdick/onedark.vim'
	use 'dracula/vim'
	use 'rockerBOO/boo-colorscheme-nvim'
	use 'rafi/awesome-vim-colorschemes'
	use { 'ishan9299/modus-theme-vim' }

	-- status line
	use { 'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('lualine').setup()
		end }
end)
