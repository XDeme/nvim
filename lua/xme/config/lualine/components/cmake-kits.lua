local project = require("cmake-kits.project")
local cmds = require("cmake-kits.commands")
local picker = require("cmake-kits.pickers")

local is_cmake_project = function()
	return project.root_dir ~= nil
end

return {
	{
		function()
			return "Build Type " .. "[" .. project.get_build_type() .. "]"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "|",
		},
		on_click = function()
			picker.select_build_type(cmds.configure)
		end,
	},
	{
		function()
			local name = "Unspecified"
			local kit = project.get_selected_kit()
			if type(kit) == "table" then
				name = kit.name
			end
			return "[" .. name .. "]"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "",
		},
		on_click = function()
			picker.select_kit(cmds.configure)
		end,
	},
	{
		function()
			return " Build"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "",
		},
		padding = {
			left = 1,
			right = 0,
		},
		on_click = function()
			cmds.build(true, {})
		end,
	},
	{
		function()
			local target = "null"
			local build = project.get_selected_build()
			if build then
				target = build.name
			end
			return "[" .. target .. "]"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "",
		},
		on_click = function()
			picker.select_build_target()
		end,
	},
	{
		function()
			return " Run"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "",
		},
		padding = {
			left = 1,
			right = 0,
		},
		on_click = function()
			cmds.run(true, {})
		end,
	},
	{
		function()
			local target = "null"
			local runnable = project.get_selected_runnable()
			if runnable then
				target = runnable.name
			end
			return "[" .. target .. "]"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "",
		},
		on_click = function()
			cmds.run(false, {})
		end,
	},
	{
		function()
			return "󰙨 Test"
		end,
		cond = project.has_ctest,
		separator = {
			left = "",
			right = "",
		},
		padding = {
			left = 1,
			right = 0,
		},
		on_click = function()
			cmds.test()
		end,
	},
}
