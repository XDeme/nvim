return {
    {
        "nvim-telescope/telescope.nvim",
        version = false,
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                lazy = true,
            },
            {
                "MunifTanjim/nui.nvim",
                lazy = true,
            },

        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

            telescope.setup({
                defaults = {
                    file_ignore_patterns = {
                        ".git/",
                        ".idea/",
                        ".vscode/",
                        ".github/",
                        ".gradle/",
                        "build/",
                        "target/",
                        "node_modules/",
                    }
                }
            })
        end
    }
}
