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
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                local opts = { buffer = bufnr, remap = false }

                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
                vim.api.nvim_set_current_dir(client.config.root_dir)

                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<C-Space>", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
            end)

            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = true
            })

            require("xme.config.cmp")

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
