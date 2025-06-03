return require('packer').startup(function(use)
     	--hrsh7th
  	use 'hrsh7th/nvim-cmp' 
    	use 'hrsh7th/cmp-nvim-lsp'
    	use 'hrsh7th/cmp-nvim-lua'
    	use 'hrsh7th/cmp-nvim-lsp-signature-help'
    	use 'hrsh7th/cmp-vsnip'                             
    	use 'hrsh7th/cmp-path'                              
    	use 'hrsh7th/cmp-buffer'                            
    	use 'hrsh7th/vim-vsnip'
	use 'wbthomason/packer.nvim'
 	use 'williamboman/mason.nvim'   
 	use 'williamboman/mason-lspconfig.nvim'
 	use 'neovim/nvim-lspconfig'
    use {
    "williamboman/mason-nvim-dap.nvim",
    requires = { "williamboman/mason.nvim" },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" }, 
    })
    end
  }
    use {
  "lervag/vimtex",
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_quickfix_mode = 0
  end
}

  	
	use 'mhartington/formatter.nvim'
	-- LSP
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	
	-- Terminal 
	use {
  		"akinsho/toggleterm.nvim",
  		tag = '*',
  		config = function()
    			require("toggleterm").setup()
  		end
	}
	-- git
	use {
  		'lewis6991/gitsigns.nvim',
  		config = function()
    			require('gitsigns').setup()
  		end
	}
	use {
 		'kdheepak/lazygit.nvim',
  		requires = { 'nvim-lua/plenary.nvim' },
	}
	-- styling
 	use 'Mofiqul/dracula.nvim'
	use 'folke/tokyonight.nvim'
	use 'navarasu/onedark.nvim'
	use 'marko-cerovac/material.nvim'
	use {'catppuccin/nvim', as = 'catppuccin'}
	-- File Explorer tree
	use {
  		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',     
		},
 	}
	-- DAP
	use 'mfussenegger/nvim-dap'
	use 'nvim-neotest/nvim-nio'

	use {
 		'rcarriga/nvim-dap-ui',
		requires = {
			'mfussenegger/nvim-dap',
			'nvim-neotest/nvim-nio',
		},
		config = function()
			require("dapui").setup()
  		end,
	}
	use {
	-- recommended packer way of installing it is to run this function, copied from documentation
         'nvim-treesitter/nvim-treesitter',
		run = function()
              		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
              		ts_update()
         	end,
	}
	-- Telescope used to fuzzy search files
 	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
    		requires = { {'nvim-lua/plenary.nvim'} }
 	}
	-- Lualine information / Status bar
 	use {
		'nvim-lualine/lualine.nvim',
    		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	--github Copliot
	use 'github/copilot.vim'



end)

