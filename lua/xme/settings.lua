--- @type Version
local version = vim.version()

vim.opt.smartindent = true

vim.opt.expandtab = true -- Convert Tab to spaces
vim.opt.shiftwidth = 4 -- Number of spaces inserted each indent
vim.opt.tabstop = 4 -- Insert 4 Spaces for a tab
vim.opt.softtabstop = 4

vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.swapfile = false

vim.opt.termguicolors = true

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cmdheight = 1

vim.opt.updatetime = 50

if version.minor >= 10 then
	vim.opt.smoothscroll = true
end

vim.opt.grepprg = "rp --vimgrep"

vim.opt.mousemoveevent = true

vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

vim.keymap.set({ "n", "i" }, "<C-s>", vim.cmd.w, {})

if vim.g.neovide then
	vim.g.neovide_transparency = 0.9
	vim.g.neovide_scale_factor = 1 * (1 / 1.1)
	vim.g.neovide_cursor_animation_length = 0.05

	vim.keymap.set("n", "<C-=>", function()
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
	end)
	vim.keymap.set("n", "<C-->", function()
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * (1 / 1.1)
	end)
end
