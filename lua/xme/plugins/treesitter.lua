return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local treesitter = require("nvim-treesitter.configs")
            treesitter.setup({
                ensure_installed = {
                    -- Web
                    "html",
                    "css",
                    "javascript",
                    "typescript",

                    "c",
                    "cpp",
                    "cmake",
                },
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
