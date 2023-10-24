require("xme.settings")
require("xme.lazy")
require("xme.auto_cmds")

if vim.fn.argc() == 1 then
    local stat = vim.loop.fs_stat(vim.fn.argv(0))
    if stat and stat.type == "directory" then
        vim.api.nvim_set_current_dir(vim.fn.argv(0))
    end
end
