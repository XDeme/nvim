vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("Close Q", {}),
    pattern = {
        "help",
        "lspinfo",
    },
    callback = function(ev)
        vim.bo[ev.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = ev.buf, silent = true })
    end
})
