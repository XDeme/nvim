return {
    cmd = {
        "clangd",
        "-j=2",
        "--clang-tidy",
        "--background-index",
        "--completion-style=bundled",
        "--header-insertion=never",
        "--function-arg-placeholders"
    },
}
