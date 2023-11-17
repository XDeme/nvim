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
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		version = false,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = false,
		version = false,
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
}
