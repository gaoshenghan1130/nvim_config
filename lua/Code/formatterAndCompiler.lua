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
        -- 正确调用 system
        local result = vim.fn.system({ "latexindent", "-w", "-b=0", file })
        if vim.v.shell_error ~= 0 then
            print("latexindent error: " .. result)
            return
        end
        vim.cmd("checktime") -- 更新文件时间戳
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
