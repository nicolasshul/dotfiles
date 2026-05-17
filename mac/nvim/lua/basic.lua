-- UI Improvements
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.laststatus = 3
vim.opt.wrap = false
vim.opt.breakindent = true

-- Indentation Defaults
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Setting expandtab off for certain filetypes
local tab_settings_group = vim.api.nvim_create_augroup("TabSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "make", "tsv", "gitconfig", "go" },
  group = tab_settings_group,
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.softtabstop = 0
  end,
})

-- Basic Searching ('/')
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- System
vim.opt.clipboard:append('unnamedplus')
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.winborder = 'rounded'
vim.loader.enable()
vim.opt.timeoutlen = 500

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- Leaders
vim.g.mapleader = " "
vim.g.maplocal = " "
