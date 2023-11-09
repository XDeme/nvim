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
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			--- @param client lsp.Client
			lsp_zero.on_attach(function(client, bufnr)
				if client.supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint(bufnr, true)
				end
				vim.api.nvim_set_current_dir(client.config.root_dir)

				require("xme.config.lsp.keymaps")(client, bufnr)
			end)

			vim.diagnostic.config(require("xme.config.lsp.diagnostics").on)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = {
					lsp_zero.default_setup,
					clangd = function()
						require("lspconfig").clangd.setup(require("xme.config.lsp.language_servers.clangd"))
					end,
					cmake = function()
						require("lspconfig").cmake.setup(require("xme.config.lsp.language_servers.cmake"))
					end,
					lua_ls = function()
						require("lspconfig").lua_ls.setup(require("xme.config.lsp.language_servers.lua_ls"))
					end,
				},
			})
		end,
	},
}
