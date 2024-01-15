vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("mfussenegger/nvim-jdtls")
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	use("akinsho/toggleterm.nvim")

	use("ThePrimeagen/vim-be-good")

	-- THEMES
	-- to install: solarized and noctis
	use("folke/tokyonight.nvim")
	use("Mofiqul/dracula.nvim")
	use("ellisonleao/gruvbox.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("AlexvZyl/nordic.nvim")
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })
	use({ "bluz71/vim-moonfly-colors", as = "moonfly" })
	use("tanvirtin/monokai.nvim")
	use("Julpikar/night-owl.nvim")
	use("navarasu/onedark.nvim")
	use("EdenEast/nightfox.nvim")
	use({ "shaunsingh/nord.nvim", as = "nordtheme" })
	use("sainnhe/everforest")

	--indent lines
	use("lukas-reineke/indent-blankline.nvim")

	--commenter
	use("terrortylor/nvim-comment")

	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	--telescope
	--also brew install ripgrep for live grep
	use({ "nvim-telescope/telescope.nvim" })
	--use 'BurntSushi/ripgrep'
	use("hrsh7th/nvim-cmp") --autocomplete
	use("hrsh7th/cmp-buffer") --autocomplete from buffer
	use("hrsh7th/cmp-path") --autocomplete for paths

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	--dap
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "jay-babu/mason-nvim-dap.nvim" })
	use("mfussenegger/nvim-dap-python")
	use("mxsdev/nvim-dap-vscode-js")
	use({
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	})

	--managing and installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	--configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")
	--fomatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	--treesitter

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
end)
