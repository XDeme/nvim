return {
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        config = function(_, opts)
            require("mini.pairs").setup(opts)
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
