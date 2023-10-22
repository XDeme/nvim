return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local treesitter = require("nvim-treesitter.configs")
            treesitter.setup({
                ensure_installed = {},
                highlight = {
                    enable = true
                },

                rainbow = {
                    enable = true
                }
            })
        end
    }
}
