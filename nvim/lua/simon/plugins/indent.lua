return {
	"lukas-reineke/indent-blankline.nvim", --indent lines
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("ibl").setup({
			scope = { show_start = false, show_end = false },
		})
	end,
}
