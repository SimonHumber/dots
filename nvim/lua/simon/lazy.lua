local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "simon.plugins.dadbod" },
	"norcalli/nvim-colorizer.lua",
	"mfussenegger/nvim-jdtls",

	"akinsho/toggleterm.nvim",

	-- THEMES
	-- to install: solarized and noctis
	"craftzdog/solarized-osaka.nvim",
	"folke/tokyonight.nvim",
	"Mofiqul/dracula.nvim",
	"ellisonleao/gruvbox.nvim",
	{ "catppuccin/nvim", as = "catppuccin" },
	"AlexvZyl/nordic.nvim",
	{ "bluz71/vim-nightfly-colors", as = "nightfly" },
	{ "bluz71/vim-moonfly-colors", as = "moonfly" },
	"tanvirtin/monokai.nvim",
	"Julpikar/night-owl.nvim",
	"navarasu/onedark.nvim",
	"EdenEast/nightfox.nvim",
	{ "shaunsingh/nord.nvim", as = "nordtheme" },
	"sainnhe/everforest",
	"talha-akram/noctis.nvim",

	"lukas-reineke/indent-blankline.nvim", --indent lines
	"terrortylor/nvim-comment", --commenter
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",

	--telescope --also brew install ripgrep for live grep
	{ "nvim-telescope/telescope.nvim" }, --, 'BurntSushi/ripgrep'
	"nvim-lua/plenary.nvim",
	"hrsh7th/nvim-cmp", --autocomplete
	"hrsh7th/cmp-buffer", --autocomplete from buffer
	"hrsh7th/cmp-path", --autocomplete for paths -- snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	--dap
	{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
	{ "jay-babu/mason-nvim-dap.nvim", dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" } },
	"mfussenegger/nvim-dap-python",

	--managing and installing lsp servers
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	--configuring lsp servers
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"jose-elias-alvarez/typescript.nvim",
	"onsails/lspkind.nvim",
	--fomatting
	"stevearc/conform.nvim",
	--linting
	"mfussenegger/nvim-lint",

	--treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags
	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
})
