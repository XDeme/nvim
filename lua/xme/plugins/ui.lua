local icons = require("xme.icons")

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
                        symbols = icons.git,
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
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local git = require("gitsigns")
            vim.keymap.set("n", "<leader>gd", function() git.diffthis() end)
            git.setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- "eol" | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
            })
        end
    },
}
