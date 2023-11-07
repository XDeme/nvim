return {
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		dependencies = {
			{
				"MunifTanjim/nui.nvim",
				lazy = true,
			},
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						".git/",
						".idea/",
						".vscode/",
						".github/",
						".gradle/",
						"build/",
						"target/",
						"node_modules/",
					},
				},
			})
		end,
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
			}
			which.register(keymaps)
		end,
	},
}
