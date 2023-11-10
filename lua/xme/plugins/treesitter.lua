return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				-- Web
				"html",
				"css",
				"javascript",
				"typescript",

				"c",
				"cpp",
				"cmake",

				"java",
				"lua",
			},
			highlight = {
				enable = true,
			},
		},
		config = function(_, opts)
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup(opts)
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		init = function()
			local rainbow_delimiters = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
					tsx = "rainbow-parens",
					javascript = "rainbow-delimiters-react",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
}
