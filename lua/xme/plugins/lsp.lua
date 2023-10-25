return {
    {
        "folke/neodev.nvim",
        init = function()
            require("neodev").setup({})
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
            "hrsh7th/cmp-path",
            "saadparwaizi/cmp_luasnip",
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions

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
                vim.lsp.inlay_hint(0, true)
                vim.api.nvim_set_current_dir(client.config.root_dir)

                require("xme.config.lsp.keymaps")(client, bufnr)
            end)

            vim.diagnostic.config(require("xme.config.lsp.diagnostics").on)

            require("xme.config.cmp")

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = { "tsserver" },
                handlers = {
                    lsp_zero.default_setup,
                    clangd = function()
                        require("lspconfig").clangd.setup(require("xme.config.lsp.language_servers.clangd"))
                    end,
                    cmake = function()
                        require("lspconfig").cmake.setup(require("xme.config.lsp.language_servers.cmake"))
                    end,
                    tsserver = function()
                        require("lspconfig").tsserver.setup(require("xme.config.lsp.language_servers.tsserver"))
                    end
                },
            })
            require("lsp_signature").setup({})
        end,
    },
}
