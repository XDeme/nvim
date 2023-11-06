vim.opt.smartindent = true

vim.opt.expandtab = true -- Convert Tab to spaces
vim.opt.shiftwidth = 4   -- Number of spaces inserted each indent
vim.opt.tabstop = 4      -- Insert 4 Spaces for a tab
vim.opt.softtabstop = 4

vim.opt.cursorline = true
vim.opt.relativenumber = true

vim.opt.swapfile = false

vim.opt.termguicolors = true

vim.opt.completeopt = 'menu,menuone,noselect'

vim.opt.updatetime = 50

vim.opt.scrolloff = 8

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", "<cmd>Explore<CR>")
