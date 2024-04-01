return {
	"nvim-telescope/telescope.nvim", --, 'BurntSushi/ripgrep'
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "Telescope" },
	config = function()
		local telescope_setup, telescope = pcall(require, "telescope")
		if not telescope_setup then
			return
		end

		local actions_setup, actions = pcall(require, "telescope.actions")
		if not actions_setup then
			return
		end
	end,
	-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
	--make sure to brew install ripgrep for grep to work
	-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
	-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
	-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
	-- keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
}
