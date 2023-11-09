local Path = require("plenary.path")
local save_path = vim.fn.stdpath("data")

vim.g.available_colorschemes = vim.tbl_filter(function(value)
	if not value:match("^tokyonight") then
		return true
	elseif value:match("^tokyonight$") then
		return true
	end
	return false
end, vim.fn.getcompletion("", "color"))

local colorscheme_file = io.open(tostring(Path:new(save_path) / "selected_colorscheme.txt"), "r")
if colorscheme_file then
	--- @type string | nil
	local colorscheme = colorscheme_file:read("*l")
	if colorscheme and #colorscheme ~= 0 then
		vim.cmd.colorscheme(colorscheme)
	else
		vim.cmd.colorscheme("onedark")
	end
	colorscheme_file:close()
end

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = vim.api.nvim_create_augroup("ColorSaver", {}),
	callback = function()
		local save_file = Path:new(save_path) / "selected_colorscheme.txt"
		local file = io.open(tostring(save_file), "w+")
		if file then
			file:write(vim.g.colors_name)
			file:close()
		end
	end,
})

vim.api.nvim_create_user_command("Colorschemes", function()
	vim.ui.select(vim.g.available_colorschemes, {
		prompt = "Select a colorscheme",
	}, function(choice)
		if choice == nil then
			return
		end

		vim.cmd.colorscheme(choice)
	end)
end, {})
