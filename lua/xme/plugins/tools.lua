return {
	{
		"akinsho/toggleterm.nvim",
		version = false,
		config = function()
			local toggleterm = require("toggleterm")
			toggleterm.setup({
				open_mapping = [[<C-t>]],
			})
		end,
	},
	{
		"XDeme/cmake-kits.nvim",
		config = function()
			local cmake = require("cmake-kits")
			local cmds = require("cmake-kits.commands")
			cmake.setup({
				configure_on_open = true,
				configure_on_save = true,
				auto_root = true,
				on_root_change = function(dir)
					if dir then
						vim.api.nvim_set_current_dir(dir)
					end
				end,
			})

			vim.keymap.set({ "i", "n" }, "<C-F5>", function()
				cmds.quick_run()
			end)
		end,
	},
}
