--not being used
return {
	"mfussenegger/nvim-lint",
	ft = { "text", "markdown" },
	config = function()
		local setup, lint = pcall(require, "lint")
		if not setup then
			return
		end

		lint.linters_by_ft = {
			text = { "proselint" },
			markdown = { "proselint" },
			-- kotlin = { "ktlint" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
		-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		-- local lint_progress = function()
		-- 	local linters = require("lint").get_running()
		-- 	if #linters == 0 then
		-- 		return "󰦕"
		-- 	end
		-- 	return "󱉶 " .. table.concat(linters, ", ")
		-- end
		-- vim.keymap.set("n", "<leader>i", function()
		-- 	lint.try_lint()
		-- end, { desc = "Trigger linting for current file" })
	end,
}
