local map = vim.api.nvim_set_keymap

---------------------------------
--- Editing and Navigation ------
vim.keymap.set('n', 'L', '$', { noremap = true }) -- 跳到行尾
vim.keymap.set('n', 'H', '^', { noremap = true }) -- 跳到行首

----------------------------------
-----------Tab Navigation---------
----------------------------------
-- 新建标签页
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { silent = true })
-- 关闭标签页
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { silent = true })
-- 下一个标签页
vim.keymap.set('n', '<leader>tl', ':tabnext<CR>', { silent = true })
-- 上一个标签页
vim.keymap.set('n', '<leader>th', ':tabprev<CR>', { silent = true })

----------------------------------
-------- Terminal Mode -----------
----------------------------------

----------------------------------
---------NvimTreeToggle-----------
----------------------------------
vim.keymap.set('n', 'tree', function()
    require("nvim-tree.api").tree.toggle()
end, { noremap = true, silent = true })

----------------------------------
----------------dap---------------
----------------------------------
-- Press f5 to debug
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {})
-- Press CTRL + b to toggle regular breakpoint
map('n', '<C-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
-- Press CTRL + c to toggle Breakpoint with Condition
map('n', '<C-c>', [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], {})
-- Press CTRL + l to toggle Logpoint
map('n', '<C-l>', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]], {})
-- Pressing F9 to stop debugging
map('n', '<F9>', [[:lua require('dap').terminate(); require('dapui').close()<CR>]], {})
-- Pressing F10 to step over
map('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], {})
-- Pressing F11 to step into
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {})
-- Pressing F12 to step out
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {})
-- Press F6 to open REPL
map('n', '<F6>', [[:lua require'dap'.repl.open()<CR>]], {})
-- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
map('n', 'dl', [[:lua require'dap'.run_last()<CR>]], {})

vim.keymap.set('n', 'debug', function()
    require("dapui").toggle()
end, { noremap = true, silent = true })
