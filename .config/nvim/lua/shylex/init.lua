vim.opt.compatible = false

require("shylex.packer")

require("shylex.colors")

require("shylex.plugins")

require("shylex.set")

require('shylex.telescope')

require('shylex.harpoon')

require("shylex.treesitter")

require("shylex.remap")

require('shylex.nvimlsp')
require('shylex.autocomplete')

require('shylex.dap')

require('shylex.fugitive')

require("shylex.fmnvim")

vim.api.nvim_set_var('python3_host_prog', "/usr/bin/python3/")

vim.api.nvim_set_var('rainbow_active', 1)

vim.api.nvim_exec("set shortmess+=c",false)
