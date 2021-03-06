vim.opt.compatible = false

vim.g.mapleader = ","

local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Catppucin Theme
Plug('catppuccin/nvim', {as = 'catppuccin'})

-- Discord Rich Presence
Plug 'andweeb/presence.nvim'

-- Inline CSS Colors
Plug 'ap/vim-css-color'

-- Rainbow Brackets
Plug 'frazrepo/vim-rainbow'

-- Icons
Plug 'ryanoasis/vim-devicons'

-- Nerdtree Files
Plug 'scrooloose/nerdtree'

--Telescope Fuzzy Finder
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {tag= "0.1.0"})

-- Neovim LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

-- Auto braces
Plug 'jiangmiao/auto-pairs'

vim.call('plug#end')

vim.api.nvim_exec("colorscheme catppuccin",false)

vim.api.nvim_exec("filetype plugin indent on", false)
vim.opt.tabstop = 2
vim.api.nvim_exec("set noexpandtab", false)
vim.api.nvim_exec("set softtabstop=2", false)
vim.api.nvim_exec("set shiftwidth=2", false)
vim.api.nvim_exec("set number", false)

vim.api.nvim_set_var('g:python3_host_prog', "/usr/bin/python3/")

vim.api.nvim_set_var('g:rainbow_active', 1)

-- CTRL+n for Nerd Tree
vim.api.nvim_set_keymap(
	"n",
	"<C-n>",
	":NERDTreeToggle<cr>",
	{noremap = false}
	)
vim.api.nvim_set_var('g:NERDTreeIgnore', {key1='["^node_modules$"]'})

vim.api.nvim_exec(
[[
function! IsNERDTreeOpen()
	return exists("t:NERDTREEBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
]],
false)

-- Sync Open File with NERDTree
vim.api.nvim_exec(
[[
function! SyncTree()
	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
			NERDTreeFind
			wincmd p
	endif
endfunction
]],
false)

-- Highlight Current Buffer in NERDTree
vim.api.nvim_exec("autocmd BufEnter * call SyncTree()", false)

-- Tall Command Area
vim.opt.cmdheight = 2

-- Long Update Time is too much delay
vim.opt.updatetime = 300

vim.api.nvim_exec("set shortmess+=c",false)
-- Discord Rich Presence
vim.api.nvim_set_var('g:presence_auto_update', {key1=1})
vim.api.nvim_set_var('g:presence_neovim_image_text', {key1="NeoVim Text Editor"})

require('shylex.nvimlsp')
require('shylex.autocomplete')
