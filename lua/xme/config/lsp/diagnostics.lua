local diagnostics = {
	enabled = true,
	on = {
		underline = true,
		virtual_text = true,
		update_in_insert = true,
		severity_sort = true,
		float = {
			focusable = false,
			source = "always",
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	off = {
		underline = true,
		virtual_text = false,
		signs = false,
		update_in_insert = false,
	},
}

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

vim.api.nvim_create_user_command("ToggleDiagnostic", function()
	if diagnostics.enabled then
		vim.diagnostic.config(diagnostics.off)
		diagnostics.enabled = false
	else
		vim.diagnostic.config(diagnostics.on)
		diagnostics.enabled = true
	end
end, { nargs = 0 })

return diagnostics
