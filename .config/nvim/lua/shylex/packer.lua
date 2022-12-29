-- ensures packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { 'catppuccin/nvim', as = 'catppuccin' }

	use 'andweeb/presence.nvim'

	use 'ap/vim-css-color'

	use 'frazrepo/vim-rainbow'

	use 'nvim-tree/nvim-web-devicons'

	use { -- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		requires = {
		-- Automatically install LSPs to stdpath for neovim
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',

		-- Useful status updates for LSP
		'j-hui/fidget.nvim',

		-- Additional lua configuration, makes nvim stuff amazing
		'folke/neodev.nvim',
		},
	}

	use 'simrat39/rust-tools.nvim'

  	use { -- Autocompletion
		'hrsh7th/nvim-cmp',
		requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update{with_sync = true})
		end,
	}

	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	use 'theprimeagen/harpoon'

	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

	use {
		'ldelossa/nvim-dap-projects',
		after = 'nvim-dap-ui',
	}

	-- git based
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'lewis6991/gitsigns.nvim'

	use 'nvim-lualine/lualine.nvim' -- fancy statusline
	use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
	use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
	use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

	use 'is0n/fm-nvim'


end)

-- Automatically source and re-compile packer whenever this file changed
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
