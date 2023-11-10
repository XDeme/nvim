return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		opts = {
			servers = {
				clangd = {
					cmd = {
						"clangd",
						"-j=2",
						"--clang-tidy",
						"--background-index",
						"--completion-style=bundled",
						"--header-insertion=never",
						"--function-arg-placeholders",
					},
				},
			},
		},
	},
}