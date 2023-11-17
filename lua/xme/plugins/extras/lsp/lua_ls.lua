return {
	{
		"folke/neodev.nvim",
		init = function()
			require("neodev").setup({
				library = {
					enabled = true,
					runtime = true,
					plugins = true,
					types = true,
				},
			})
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		opts = {
			servers = {
				lua_ls = {
					Lua = {
						workspace = {},
					},
				},
			},
		},
	},
}
