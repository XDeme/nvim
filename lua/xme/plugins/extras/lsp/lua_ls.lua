return {
	{
		"folke/neodev.nvim",
		init = function()
			require("neodev").setup({})
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		opts = {
			servers = {
				lua_ls = {
					Lua = {
						workspace = {
							library = vim.api.nvim_get_runtime_file("*", true),
						},
					},
				},
			},
		},
	},
}
