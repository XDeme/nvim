local project = require("cmake-kits.project")
local cmds = require("cmake-kits.commands")

local is_cmake_project = function()
	return project.root_dir ~= nil
end

return {
	{
		function()
			return "Build Type " .. "[" .. project.build_type .. "]"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "|",
		},
		on_click = function()
			project.select_build_type(cmds.configure)
		end,
	},
	{
		function()
			local name = "Unspecified"
			if type(project.selected_kit) == "table" then
				name = project.selected_kit.name
			end
			return "[" .. name .. "]"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "",
		},
		on_click = function()
			project.select_kit(cmds.configure)
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
			cmds.quick_build()
		end,
	},
	{
		function()
			local target = "null"
			if project.selected_build then
				target = project.selected_build.name
			end
			return "[" .. target .. "]"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "",
		},
		on_click = function()
			project.select_build_target()
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
			cmds.quick_run()
		end,
	},
	{
		function()
			local target = "null"
			if project.selected_runnable then
				target = project.selected_runnable.name
			end
			return "[" .. target .. "]"
		end,
		cond = is_cmake_project,
		separator = {
			left = "",
			right = "",
		},
		on_click = function()
			project.select_runnable_target(function()
				cmds.quick_run()
			end)
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
