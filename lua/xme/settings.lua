vim.opt.smartindent = true

vim.opt.expandtab = true -- Convert Tab to spaces
vim.opt.shiftwidth = 4 -- Number of spaces inserted each indent
vim.opt.tabstop = 4 -- Insert 4 Spaces for a tab
vim.opt.softtabstop = 4

vim.opt.cursorline = true
vim.opt.relativenumber = true

vim.opt.swapfile = false

vim.opt.termguicolors = true

vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.updatetime = 50

vim.opt.scrolloff = 8
vim.opt.smoothscroll = true

vim.opt.grepprg = "rp --vimgrep"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

vim.keymap.set({ "n", "i" }, "<C-s>", vim.cmd.w, {})

if vim.g.neovide then
	vim.opt.guifont = "Fira Code:h10"
	vim.g.neovide_transparency = 0.9
	vim.g.neovide_scale_factor = 1 * (1 / 1.1)

	vim.keymap.set("n", "<C-=>", function()
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
	end)
	vim.keymap.set("n", "<C-->", function()
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * (1 / 1.1)
	end)
end
