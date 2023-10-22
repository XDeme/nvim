return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",

            {
                "hrsh7th/nvim-cmp", -- Completion
                event = { "InsertEnter", "CmdlineEnter" },
            },
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            --"hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-path",
            "saadparwaizi/cmp_luasnip",
        },

        config = function()
            local lsp_zero = require("lsp-zero")
            local cmp = require("cmp")

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<C-Space>", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            end)

            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = true
            })

            cmp.setup({
                completion = { completeopt = "menu,menuone,noinsert" },
                source = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                    scrollbar = true,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        elseif require("luasnip").expand_or_jumpable() then
                            require("luasnip").expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<Esc>"] = cmp.mapping(function(fallback)
                        require("luasnip").unlink_current()
                        fallback()
                    end)
                }),
                experimental = {
                    ghost_text = true,
                }
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = { "tsserver" },
                handlers = {
                    lsp_zero.default_setup,
                    clangd = function()
                        require("lspconfig").clangd.setup(require("xme.config.lsp.clangd"))
                    end
                },
            })
            require("lsp_signature").setup({})
        end,
    },
    {
        "folke/neodev.nvim",
        init = function()
            require("neodev").setup({})
        end
    },

}
