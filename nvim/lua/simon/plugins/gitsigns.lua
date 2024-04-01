return {
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local setup, gitsigns = pcall(require, "gitsigns")
		if not setup then
			return
		end

		gitsigns.setup()
	end,
}
