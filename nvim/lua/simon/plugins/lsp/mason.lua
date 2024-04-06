return {
	--managing and installing lsp servers
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
	cmd = "Mason",
	-- event = { "BufReadPre", "BufNewFile" },
	ft = {
		"html,htmldjango,css,c,cpp,rust,java,kotlin,javascript,javascriptreact,typescript,typescriptreact,json,go,lua,python,sh,toml,sql",
	},
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
				"rust_analyzer",
				"jdtls",
				"kotlin_language_server",
				"tsserver",
				"jsonls",
				"gopls",
				"lua_ls",
				"basedpyright",
				"bashls",
				"taplo",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				"black",
				"clang-format",
				"djlint",
				-- "goimports",
				-- "golines",
				"google-java-format",
				"ktlint",
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
