require('lspconfig').clangd.setup({
    on_attach = function(client, bufnr)
        -- 启用格式化
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})


require('lspconfig').texlab.setup {}

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }, -- 忽略 `vim` 是 undefined 的报错
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            format = {
                enable = true,
            }
        },
    },
}

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
})
