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
    use 'alvan/vim-closetag'
    use 'mattn/emmet-vim'

	-- status line
	use { 'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('lualine').setup()
		end, }

    use { 'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end, }

    -- LSP
    use 'nvim-treesitter/nvim-treesitter'
    -- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'
    use 'majutsushi/tagbar'

    -- Navigation
    use { 'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function() require('telescope').setup({
            defaults = {
                file_ignore_patterns = { "node_modules/**", "**/node_modules" }
            }
        }) end, }

    -- EasyMotion
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use { 'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end }
    use 'cohama/lexima.vim'
    use 'dense-analysis/ale'

    use 'sbdchd/neoformat'

    use 'tpope/vim-surround'
end)
