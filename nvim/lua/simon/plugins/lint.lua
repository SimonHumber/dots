local setup, lint = pcall(require, "lint")
if not setup then
	return
end

lint.linters_by_ft = {
	-- kotlin = { "ktlint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
-- lint.setup()
