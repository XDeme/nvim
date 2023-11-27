return {
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
	},
	{
		"MunifTanjim/nui.nvim",
		lazy = true,
	},
	{
		"folke/persistence.nvim",
		event = { "BufReadPre" },
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restore Session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore Last Session",
			},
		},
		config = function()
			local persistence = require("persistence")
			persistence.setup({
				options = { "buffers", "curdir", "winsize", "terminal" },
			})
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			local which = require("which-key")
			which.setup({})
			local keymaps = {
				["<leader>g"] = "Git",
				["<leader>q"] = "Session",
				["<leader>f"] = "Find",
				["<leader>l"] = "Lsp",
				["g"] = "Goto",
				["<C-s>"] = "Save file",
			}
			which.register(keymaps)
		end,
	},
}
