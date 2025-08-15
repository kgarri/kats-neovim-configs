vim.opt.guicursor = "n-v-c-ve-o-i-r-c-ci-cr-sm-a:block-nCursor"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldtext = ""
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.fillchars:append({ fold = " ", foldsep = " ", foldopen = "-", foldclose = "+" })
vim.opt.foldcolumn = "1"

vim.o.statuscolumn ="%!v:lua.require('kat.config.statuscol').statuscol()"
