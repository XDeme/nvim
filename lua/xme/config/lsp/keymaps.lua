local telescope = require("telescope.builtin")

return function(_, bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }

	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.declaration()
	end, { buffer = bufnr, silent = true, desc = "Declaration" })
	vim.keymap.set("n", "gd", function()
		telescope.lsp_definitions()
	end, { buffer = bufnr, silent = true, desc = "Definitions" })
	vim.keymap.set("n", "gr", function()
		telescope.lsp_references()
	end, { buffer = bufnr, silent = true, desc = "References" })
	vim.keymap.set("n", "<c-Space>", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<F2>", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
end
