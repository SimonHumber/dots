return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	-- event = { "InsertEnter" },
	config = function()
		local setup, conform = pcall(require, "conform")
		if not setup then
			return
		end
		local sql_config_file = os.getenv("HOME") .. "/.config/sql_formatter/sql_formatter.json"
		conform.setup({
			formatters_by_ft = {
				html = { "prettierd" },
				htmldjango = { "djlint" },
				css = { "prettierd" },
				c = { "clang_format" },
				java = { "google-java-format" },
				rust = { "rustfmt" },
				go = { "goimports", "golines" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				json = { "prettierd" },
				kotlin = { "ktlint" },
				python = { "black" },
				lua = { "stylua" },
				sql = { "sql_formatter" },
				sh = { "shfmt" },
			},
		})
		conform.formatters.sql_formatter = {
			prepend_args = {
				"--config",
				'{"language":"postgresql","keywordCase":"upper","dataTypeCase":"upper","functionCase":"upper"}',
				-- "indentStyle":"tabularLeft",
			},
		}
		--format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf, timeout_ms = 500 })
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
	end,
}
