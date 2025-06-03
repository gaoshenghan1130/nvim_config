require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls" },  -- 自动安装 lua-language-server
    }

