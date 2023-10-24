local diagnostics = {
    on = {
        underline = true,
        virtual_text = true,
        update_in_insert = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            source = "always",
        }
    },
    off = {
        underline = true,
        virtual_text = false,
        signs = false,
        update_in_insert = false,
    }
}
vim.g.diagnostics_enabled = true

vim.api.nvim_create_user_command("ToggleDiagnostic", function()
    if vim.g.diagnostics_enabled then
        vim.diagnostic.config(diagnostics.off)
        vim.g.diagnostics_enabled = false
    else
        vim.diagnostic.config(diagnostics.on)
        vim.g.diagnostics_enabled = true
    end
end, { nargs = 0 })

return diagnostics
