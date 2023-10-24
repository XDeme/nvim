local telescope = require("telescope.builtin")

return function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gd", function() telescope.lsp_definitions() end, opts)
    vim.keymap.set("n", "gr", function() telescope.lsp_references() end, opts)
    vim.keymap.set("n", "<C-Space>", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
end
