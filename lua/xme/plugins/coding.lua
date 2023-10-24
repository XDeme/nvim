return {
    {
        "L3MON4D3/LuaSnip",
        event = { "InsertEnter" },
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end
    },
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
    --[[
    {
        "glepnir/lspsaga.nvim",
        event = "VeryLazy",
    },
--]]
}
