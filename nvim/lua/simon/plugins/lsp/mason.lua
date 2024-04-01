return {
	--managing and installing lsp servers
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
	-- cmd = "Mason",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local mason_status, mason = pcall(require, "mason")
		if not mason_status then
			return
		end

		local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
		if not mason_lspconfig_status then
			return
		end

		local mason_tool_installer = require("mason-tool-installer")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"clangd",
				"jdtls",
				"kotlin_language_server",
				"tsserver",
				"lua_ls",
				"pyright",
				"bashls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				"black",
				"clang-format",
				"djlint",
				"goimports",
				"golines",
				"google-java-format",
				"ktlint",
				"rustfmt",
				"shfmt",
				"sql-formatter",
				"stylua",
				--dap
				"cpptools",
				"debugpy",
				"js-debug-adapter",
			},
		})
	end,
}
