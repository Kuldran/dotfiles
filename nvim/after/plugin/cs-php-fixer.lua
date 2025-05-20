local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.phpcsfixer.with({
            extra_args = {
                "--using-cache=no",
                "--no-interaction",
                "--config=.php-cs-fixer.dist.php"
            },
        }),
        null_ls.builtins.formatting.prettier,
    },
    on_attach = function(client, buffer)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 3000})
                end,
            })
        end
    end,
})
