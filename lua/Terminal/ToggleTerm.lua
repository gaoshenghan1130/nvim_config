-- 设置 <C-\> 切换终端（默认）
vim.keymap.set("n", "<C-\\>", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- 自定义浮动终端运行 lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

vim.keymap.set("n", "<leader>g", function() lazygit:toggle() end, { noremap = true, silent = true })

