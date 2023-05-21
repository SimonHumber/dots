require("onedark").setup({
	style = "deep", --options are dark, darker, cool, deep, warm, warmer
	code_style = {
		comments = "bold",
	},
})
vim.g.nightflyTransparent = true
require("tokyonight").setup({
	transparent = "true",
})
local status, _ = pcall(vim.cmd, "colorscheme tokyonight-moon")
if not status then
	print("Color scheme not found!")
	return
end
--monokai, monokai_pro, monokai_soda, monokai_ristretto
--nightfox dayfox dawnfox duskfox nordfox terafox carbonfox
--dracula, dracula-soft
