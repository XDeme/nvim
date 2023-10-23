return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        init = function()
            vim.g.neo_tree_remove_legacy_commands = 1
            vim.keymap.set("n", "<leader>e", function()
                require("neo-tree.command").execute({ toggle = true, position = "left" })
            end)
        end,
        config = function()
            local neotree = require("neo-tree")
            vim.fn.sign_define("DiagnosticSignError",
                { text = " ", texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn",
                { text = " ", texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo",
                { text = " ", texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint",
                { text = "󰌵", texthl = "DiagnosticSignHint" })

            neotree.setup({
                close_if_last_window = true,
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                default_component_configs = {
                    indent = {
                        indent_size = 2,
                    },
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "󰜌",
                        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                        -- then these will never be used.
                        default = "*",
                        highlight = "NeoTreeFileIcon"
                    },
                    modified = {
                        symbol = "[+]",
                        highlight = "NeoTreeModified",
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                            modified  = "M", -- or "", but this is redundant info if you use git_status_colors on the name
                            deleted   = "✖", -- this can only be used in the git_status source
                            renamed   = "󰁕", -- this can only be used in the git_status source
                            -- Status type
                            untracked = "",
                            ignored   = "",
                            unstaged  = "󰄱",
                            staged    = "",
                            conflict  = "",
                        },
                    },
                },
                window = {
                    position = "left",
                    width = 40,
                    mappings = {
                        ["<space>"] = {
                            "toggle_node",
                            nowait = true,
                        },
                        ["A"] = "add_directory",
                        ["<F2>"] = "rename",
                        ["<F5>"] = "refresh",
                    },
                },
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_hidden = true,
                    }
                }
            })
        end
    }
}
