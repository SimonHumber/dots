local setup, conform = pcall(require, "conform")
if not setup then
	return
end
local sql_config_file = os.getenv("HOME") .. "/.config/sql_formatter/sql_formatter.json"
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		java = { "google-java-format" },
		c = { "clang_format" },
		sh = { "shfmt" },
		sql = { "sql_formatter" },
		kotlin = { "ktlint" },
	},
})
conform.formatters.sql_formatter = {
	prepend_args = {
		"--config",
		'{"language":"postgresql","keywordCase":"upper","dataTypeCase":"upper","functionCase":"upper"}',
		-- "indentStyle":"tabularLeft",
	},
}
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		conform.format({ bufnr = args.buf, timeout_ms = 1000 })
	end,
})
-- use leader l to format
vim.keymap.set({ "n", "v" }, "<leader>l", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 2000,
	})
end, { desc = "Format file or range (in visual mode)" })
