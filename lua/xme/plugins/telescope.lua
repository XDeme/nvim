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
			telescope.load_extension("workspaces")

			--- Find
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
			vim.keymap.set("n", "<leader>fw", telescope.extensions.workspaces.workspaces, { desc = "Find Workspaces" })

			--- Git
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Status" })
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Files" })
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Checkout Branches" })
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Checkout Commits" })

			vim.keymap.set("n", "<leader>wa", require("workspaces").add, { desc = "Workspace add" })
			vim.keymap.set("n", "<leader>wd", require("workspaces").remove, { desc = "Workspace delete" })
		end,
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = false,
		version = false,
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},

	{
		"natecraddock/workspaces.nvim",
		config = function()
			local work = require("workspaces")
			local project = require("cmake-kits.project")
			local utils = require("cmake-kits.utils")
			work.setup({
				hooks = {
					open = function()
						local cwd = vim.loop.cwd()
						if utils.is_cmake_project(cwd) then
							project.set_root_dir(cwd)
						else
							project.set_root_dir(nil)
						end
					end,
				},
			})
		end,
	},
}
