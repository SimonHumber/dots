local setup, conform = pcall(require, "conform")
if not setup then
	return
end

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
