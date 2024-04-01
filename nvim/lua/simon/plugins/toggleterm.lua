return {
	"akinsho/toggleterm.nvim",
	keys = "<F5>",
	config = function()
		local status_ok, toggleterm = pcall(require, "toggleterm")
		if not status_ok then
			return
		end

		toggleterm.setup({
			open_mapping = [[<f5>]],
			direction = "horizontal",
			size = 20,
			shade_terminals = false,
			insert_mappings = false,
		})
	end,
}
