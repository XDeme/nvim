return {
	{
		"L3MON4D3/LuaSnip",
		event = { "InsertEnter" },
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_snipmate").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp", -- Completion
		version = false,
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"roobert/tailwindcss-colorizer-cmp.nvim",
		},
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			require("xme.config.cmp")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"numToStr/Comment.nvim",
		version = false,
		opts = {
			toggler = {
				line = "<C-/>",
				block = nil,
			},
			opleader = {
				line = "<C-/>",
				block = nil,
			},
		},
		config = function(_, opts)
			local comment = require("Comment")
			comment.setup(opts)
		end,
	},
}
