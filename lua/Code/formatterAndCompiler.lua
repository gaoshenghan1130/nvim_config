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
        vim.cmd("VimtexCompile")
    end,
})

-- tabs and spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", { noremap = true, silent = true })

vim.o.number = true
