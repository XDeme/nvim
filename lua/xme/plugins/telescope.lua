return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
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

					"Games/",
					"games/",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			telescope.setup(opts)
			telescope.load_extension("fzf")
			--- Find
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })

			--- Git
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Status" })
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Files" })
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Checkout Branches" })
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Checkout Commits" })
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = false,
		version = false,
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
}
