local lspconfig = require("lspconfig.util")
return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		opts = {
			servers = {
				neocmake = {
					filetypes = { "cmake", "CMakeLists.txt" },
					root_dir = lspconfig.root_pattern(".git", "cmake", "CMakeLists.txt"),
				},
			},
		},
	},
}
