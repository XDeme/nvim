--- @type Version
local version = vim.version()

return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function(_, opts)
			local lsp_zero = require("lsp-zero")

			--- @param client lsp.Client
			lsp_zero.on_attach(function(client, bufnr)
				if version >= 10 then
					if client.supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint(bufnr, true)
					end
				end
				vim.api.nvim_set_current_dir(client.config.root_dir)

				require("xme.config.lsp.keymaps")(client, bufnr)
			end)

			vim.diagnostic.config(require("xme.config.lsp.diagnostics").on)

			local servers = opts.servers
			for server, config in pairs(servers) do
				lsp_zero.configure(server, config)
			end

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "prettierd" },
				handlers = {
					lsp_zero.default_setup,
				},
			})
		end,
	},
}
