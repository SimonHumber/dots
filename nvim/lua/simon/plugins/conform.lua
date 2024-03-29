local setup, conform = pcall(require, "conform")
if not setup then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		json = { "prettierd" },
		java = { "google-java-format" },
		c = { "clang_format" },
		sh = { "shfmt" },
		sql = { "sql_formatter" },
	},
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
