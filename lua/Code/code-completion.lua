vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true }

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
 
mapping = {
  -- Tab / Shift+Tab：浏览候选项
  ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

  -- 文档滚动
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),

  -- 手动触发补全（改为 <C-u>，因为 <C-.> 无法在 macOS 终端用）
  ['<C-u>'] = cmp.mapping.complete(),

  -- 关闭补全窗口
  ['<C-e>'] = cmp.mapping.close(),
  ['<Esc>'] = cmp.mapping.abort(),

  -- 回车：确认当前选中项
  ['<CR>'] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
}),
},

snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },

window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua', keyword_length = 2 },
    { name = 'buffer', keyword_length = 2 },
    { name = 'vsnip', keyword_length = 2 },
  },

  -- add formating of the different sources
    formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'b',
              path = 'p'
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },

})
