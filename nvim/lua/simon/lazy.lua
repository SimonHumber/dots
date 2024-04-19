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
	{ import = "simon.core.colorscheme" },
	{ import = "simon.plugins.lsp.mason" },
	{ import = "simon.plugins.lsp.lspconfig" },
	{ import = "simon.plugins.ftplugin.java" },
	{ import = "simon.plugins.autopairs" },
	{ import = "simon.plugins.colorizer" },
	{ import = "simon.plugins.comment" },
	{ import = "simon.plugins.conform" },
	{ import = "simon.plugins.dadbod" },
	{ import = "simon.plugins.dapui" },
	{ import = "simon.plugins.gitsigns" },
	{ import = "simon.plugins.indent" },
	{ import = "simon.plugins.lint" },
	{ import = "simon.plugins.lualine" },
	{ import = "simon.plugins.nvim-cmp" },
	{ import = "simon.plugins.nvim-tree" },
	{ import = "simon.plugins.telescope" },
	{ import = "simon.plugins.toggleterm" },
	{ import = "simon.plugins.treesitter" },
	-- runs automatically, no setup needed
	{ "tpope/vim-surround", event = { "BufReadPre", "BufNewFile" } },
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",
	-- { "vim-scripts/ReplaceWithRegister", event = { "BufReadPre", "BufNewFile" } },
})
