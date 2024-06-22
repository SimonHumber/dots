return {
	-- "craftzdog/solarized-osaka.nvim",
	-- THEMES
	-- to install: noctis
	-- "folke/tokyonight.nvim",
	-- "Mofiqul/dracula.nvim",
	-- "ellisonleao/gruvbox.nvim",
	-- { "catppuccin/nvim", as = "catppuccin" },
	-- "AlexvZyl/nordic.nvim",
	-- "bluz71/vim-nightfly-colors",
	-- { "bluz71/vim-moonfly-colors", as = "moonfly" },
	-- "tanvirtin/monokai.nvim",
	-- "Julpikar/night-owl.nvim",
	-- "navarasu/onedark.nvim",
	"EdenEast/nightfox.nvim",
	-- { "shaunsingh/nord.nvim", as = "nordtheme" },
	-- "sainnhe/everforest",
	-- "talha-akram/noctis.nvim",
	config = function()
		-- require("onedark").setup({
		-- 	style = "dark", --options are dark, darker, cool, deep, warm, warmer
		-- 	transparent = true,
		-- 	code_style = {
		-- 		comments = "bold",
		-- 	},
		-- })
		-- vim.g.nightflyTransparent = true
		-- vim.g.moonflyTransparent = true
		-- require("tokyonight").setup({
		-- 	transparent = true,
		-- })
		-- require("gruvbox").setup({
		-- 	transparent_mode = true,
		-- })
		-- require("dracula").setup({
		-- 	transparent_bg = true,
		-- })
		-- require("nightfox").setup({ options = {
		-- 	transparent = true,
		-- } })
		-- require("solarized-osaka").setup({
		-- 	transparent = false,
		-- })
		local status, _ = pcall(vim.cmd, "colorscheme nightfox")
		if not status then
			print("Color scheme not found!")
			return
		end
		--monokai, monokai_pro, monokai_soda, monokai_ristretto
		--nightfox dayfox dawnfox duskfox nordfox terafox carbonfox
		--dracula, dracula-soft
	end,
}
