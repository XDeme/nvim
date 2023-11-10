return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		dependencies = {
			{
				"nvim-telescope/telescope-ui-select.nvim",
				version = false,
			},
		},
		opts = {
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
					"%.class",
					"%.exe",
					"%.dll",
					"%.nls",
					"%.tar.gz",
					"%.tar",
					"%.rar",
					"%.zip",
					"%.7z",
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			telescope.setup(opts)
			telescope.load_extension("ui-select")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
		end,
	},
}
