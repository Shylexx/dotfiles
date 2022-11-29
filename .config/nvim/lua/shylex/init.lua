vim.opt.compatible = false

vim.g.mapleader = ","

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

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
Plug 'simrat39/rust-tools.nvim'

Plug 'mfussenegger/nvim-dap'

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do']= 'TSUpdate'})

-- Neogit
Plug 'TimUntersberger/neogit'

-- FM Nvim
Plug 'is0n/fm-nvim'

vim.call('plug#end')

require("shylex.treesitter")

require("shylex.neogit")

require("shylex.colors")

require("shylex.remap")

require("shylex.set")

require("shylex.fmnvim")

vim.api.nvim_set_var('python3_host_prog', "/usr/bin/python3/")

vim.api.nvim_set_var('rainbow_active', 1)

-- Tall Command Area
vim.opt.cmdheight = 2

-- Long Update Time is too much delay
vim.opt.updatetime = 300

vim.api.nvim_exec("set shortmess+=c",false)

-- Discord Rich Presence
vim.api.nvim_set_var('g:presence_auto_update', {key1=1})
vim.api.nvim_set_var('g:presence_neovim_image_text', {key1="NeoVim Editor"})

require('shylex.nvimlsp')
require('shylex.autocomplete')

require('shylex.telescope')
