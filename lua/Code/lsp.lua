local on_attach = function(client, bufnr)
    -- 快捷键映射函数
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, bufopts)          -- 跳转到定义
    keymap("n", "gD", vim.lsp.buf.declaration, bufopts)         -- 跳转到声明
    keymap("n", "gi", vim.lsp.buf.implementation, bufopts)      -- 跳转到实现
    keymap("n", "gr", vim.lsp.buf.references, bufopts)          -- 查看引用
    keymap("n", "K", vim.lsp.buf.hover, bufopts)                -- 文档悬浮
    keymap("n", "<leader>rn", vim.lsp.buf.rename, bufopts)      -- 重命名
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) -- 代码操作

    -- 如果开启格式化
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end
end

require('lspconfig').clangd.setup({
    cmd = { "clangd", "--std=c++11" },
    on_attach = on_attach,
})


require('lspconfig').texlab.setup {
    on_attach = on_attach,
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                onSave = true, -- 保存时触发编译检查
                forwardSearchAfter = false,
            },
            chktex = {
                onEdit = true,        -- 编辑时检查
                onOpenAndSave = true, -- 打开和保存时检查
            },
            diagnosticsDelay = 300,
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = false,
            },
        },
    },
}

require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
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
