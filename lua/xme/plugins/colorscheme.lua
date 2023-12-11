return {
	{
		"folke/tokyonight.nvim",
		config = function()
			local theme = require("tokyonight")
			theme.setup({
				style = "night",
				-- transparent = true,
			})
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			local theme = require("onedark")
			theme.setup({
				style = "darker",
			})
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			local t = require("transparent")
			t.setup({})
			t.clear_prefix("NeoTree")
		end,
	},
}
