require("xme.settings")
require("xme.lazy")
require("xme.cmds")
require("xme.auto_cmds")

if vim.fn.argc() == 1 then
    local stat = vim.loop.fs_stat(vim.fn.argv(0))
    if stat and stat.type == "directory" then
        local str = require("lspconfig").util.find_git_ancestor(vim.fn.argv(0))
        if str ~= nil then
            vim.api.nvim_set_current_dir(str)
        else
            vim.api.nvim_set_current_dir(vim.fn.argv(0))
        end
    end
end
