return {
    {
        "navarasu/onedark.nvim",
        config = function()
            local theme = require("onedark")
            theme.setup({
                style = "darker",
            })
            theme.load()
        end
    }
}
