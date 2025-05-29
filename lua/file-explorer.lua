require("nvim-tree").setup({
  hijack_netrw = true,
  sync_root_with_cwd = true,
  view = {
    width = 30,
    side = "left",
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
