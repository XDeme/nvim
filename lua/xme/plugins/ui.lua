local icons = require("xme.icons")
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			vim.keymap.set("n", "<leader>e", function()
				require("neo-tree.command").execute({ toggle = true, position = "left" })
			end)
		end,
		config = function()
			local neotree = require("neo-tree")

			neotree.setup({
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				default_component_configs = {
					indent = {
						indent_size = 2,
					},
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "󰜌",
						-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
						-- then these will never be used.
						default = "*",
						highlight = "NeoTreeFileIcon",
					},
					modified = {
						symbol = "[+]",
						highlight = "NeoTreeModified",
					},
					git_status = {
						symbols = icons.git,
					},
				},
				window = {
					position = "left",
					width = 40,
					mappings = {
						["<space>"] = {
							"toggle_node",
							nowait = true,
						},
						["A"] = "add_directory",
						["<F2>"] = "rename",
						["<F5>"] = "refresh",
					},
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_hidden = true,
					},
					group_empty_dirs = false,
					use_libuv_file_watcher = true,
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local git = require("gitsigns")
			git.setup({
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- "eol" | 'overlay' | 'right_align'
					delay = 500,
					ignore_whitespace = false,
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"moll/vim-bbye",
				event = { "BufRead" },
			},
		},
		config = function()
			local bufferline = require("bufferline")
			vim.keymap.set("n", "<leader>d", "<cmd>Bdelete!<CR>")
			vim.keymap.set("n", "<A-Left>", "<cmd>BufferLineCyclePrev<CR>")
			vim.keymap.set("n", "<A-Right>", "<cmd>BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>")
			vim.keymap.set("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>")
			vim.keymap.set("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>")
			vim.keymap.set("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>")
			vim.keymap.set("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>")
			vim.keymap.set("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>")
			vim.keymap.set("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>")
			vim.keymap.set("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>")
			vim.keymap.set("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>")
			bufferline.setup({
				options = {
					diagnostics = "nvim_lsp",
					indicator = {
						style = "underline",
					},
					diagnostics_indicator = function(count)
						if count > 9 then
							return "9+"
						end
						return tostring(count)
					end,
					close_command = "Bdelete! %d",
					offsets = {
						{
							filetype = "neo-tree",
							text = "Explorer",
							text_align = "center",
						},
					},
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
				},
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local lualine = require("lualine")
			local project = require("cmake-kits.project")
			local cmds = require("cmake-kits.commands")
			local kits = require("cmake-kits.kits")
			lualine.setup({
				options = {
					theme = "auto",
					globalstatus = true,
				},
				sections = {
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = require("xme.config.lualine.components.cmake-kits"),
					lualine_z = { "location" },
				},
			})
		end,
	},

	{
		"stevearc/dressing.nvim",
		version = false,
		config = function()
			local dressing = require("dressing")
			dressing.setup({})
		end,
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
			require("notify").setup({
				background_colour = "#222222",
				timeout = 800,
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { focusable = false })
				end,
			})
		end,
	},
}
