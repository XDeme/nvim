return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
			ensure_installed = {
				"codelldb",
			},
		},
	},

	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		opts = {},
		config = function() end,
	},

	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Add debug breakpoint" })
			vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "Start or continue debugger" })
		end,
	},
}
