return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
	config = function()
		local setup, nvimtree = pcall(require, "nvim-tree")
		if not setup then
			return
		end

		-- recommended settings from nvim-tree documentation
		vim.g.loaded = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			git = {
				ignore = false,
			},
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
		})
	end,
}
