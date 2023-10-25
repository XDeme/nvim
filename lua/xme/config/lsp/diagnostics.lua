local diagnostics = {
    enabled = true,
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

vim.api.nvim_create_user_command("ToggleDiagnostic", function()
    if diagnostics.enabled then
        vim.diagnostic.config(diagnostics.off)
        diagnostics.enabled = false
    else
        vim.diagnostic.config(diagnostics.on)
        diagnostics.enabled = true
    end
end, { nargs = 0 })

return diagnostics
