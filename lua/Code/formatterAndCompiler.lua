require('formatter').setup({
    filetype = {
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
                    stdin = true,
                }
            end
        },
    }
})

-- lua formatter
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.lua",
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- vimtex formatter and compiler settings
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.tex",
    callback = function()
        local file = vim.fn.expand("%:p")
        -- 使用 vim.fn.system 执行外部命令
        vim.fn.system("latexindent -w " .. file)
        -- 重新加载缓冲区
        vim.cmd("edit!")

        -- 延迟调用 Vimtex 单次编译
        vim.defer_fn(function()
            vim.cmd("VimtexCompileSS")
        end, 100)
    end,
})

-- tabs and spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", { noremap = true, silent = true })

vim.o.number = true
