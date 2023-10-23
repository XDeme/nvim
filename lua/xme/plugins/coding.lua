return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = { "InsertEnter" },
    },

    {
        "glepnir/lspsaga.nvim",
        event = "VeryLazy",
    },
}
