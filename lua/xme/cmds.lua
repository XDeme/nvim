local config_path = vim.fn.stdpath("config")

vim.api.nvim_create_user_command("Config", function()
	vim.api.nvim_set_current_dir(config_path)
	require("neo-tree.command").execute({ toggle = true, position = "left" })
end, {})
