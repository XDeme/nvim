return {
    {
        "akinsho/toggleterm.nvim",
        version = false,
        config = function()
            local toggleterm = require("toggleterm")
            toggleterm.setup({
                open_mapping = [[<C-t>]]
            })
        end
    }
}
