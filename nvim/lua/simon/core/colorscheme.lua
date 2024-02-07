require("onedark").setup({
	style = "dark", --options are dark, darker, cool, deep, warm, warmer
	transparent = true,
	code_style = {
		comments = "bold",
	},
})
vim.g.nightflyTransparent = true
vim.g.moonflyTransparent = true
require("tokyonight").setup({
	transparent = true,
})
require("gruvbox").setup({
	transparent_mode = true,
})
require("dracula").setup({
	transparent_bg = true,
})
require("nightfox").setup({ options = {
	transparent = true,
} })
local status, _ = pcall(vim.cmd, "colorscheme moonfly")
if not status then
	print("Color scheme not found!")
	return
end
--monokai, monokai_pro, monokai_soda, monokai_ristretto
--nightfox dayfox dawnfox duskfox nordfox terafox carbonfox
--dracula, dracula-soft
