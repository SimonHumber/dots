return {
	"neovim/nvim-lspconfig",
	dependencies = { "hrsh7th/cmp-nvim-lsp", "jose-elias-alvarez/typescript.nvim" },
	-- add this to dependencies for psql lsp (dadbod works without it)
	-- "nanotee/sqls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	-- ft = {
	-- 	"html,htmldjango,css,c,cpp,rust,java,kotlin,javascript,javscriptreact,typescript,typescriptreact,json,go,lua,python,sh,toml",
	-- },
	-- cmd = { "LspInfo", "LspStart", "LspStop", "LspRestart" },
	config = function()
		local lspconfig_status, lspconfig = pcall(require, "lspconfig")
		if not lspconfig_status then
			return
		end

		local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if not cmp_nvim_lsp_status then
			return
		end

		local keymap = vim.keymap

		--enable keybinds for available lsp servers
		local on_attach = function(client, bufnr) end
		keymap.set("n", "<space>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		keymap.set("n", "<space>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		keymap.set("n", "<space>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		keymap.set("n", "<space>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		--keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		--keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		--keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
		keymap.set("n", "<space>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		keymap.set("n", "<space>ge", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		keymap.set("n", "<space>N", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
		keymap.set("n", "<space>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
		keymap.set("n", "<space>gl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

		--used to enable autocompletion
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		--lsp is not designed for django but still nice for suggestions
		lspconfig["html"].setup({
			filetypes = { "html", "htmldjango" },
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tsserver"].setup({
			server = {
				capabilities = capabilities,
				on_attach = on_attach,
			},
		})

		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["basedpyright"].setup({
			settings = {
				basedpyright = {
					-- change to all for VERY strict type checking
					typeCheckingMode = "basic",
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})
		--cannot have both lspconfig and nvim-jdtls running at the same time
		-- lspconfig["jdtls"].setup({
		-- 	filetypes = { "java" },
		-- 	 cmd = { "/Users/simontran/.local/share/nvim/mason/packages/jdtls/jdtls" },
		-- 	root_dir = lspconfig.util.root_pattern("gradlew"),
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["kotlin_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["taplo"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		-- seems like it's deprecated
		lspconfig["ltex"].setup({
			filetypes = { "text", "markdown" },
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				ltex = {
					language = "en-CA",
				},
			},
		})
		-- require("lspconfig").sqls.setup({
		-- 	on_attach = function(client, bufnr)
		-- 		require("sqls").on_attach(client, bufnr) -- require sqls.nvim
		-- 	end,
		-- 	settings = {
		-- 		sqls = {
		-- 			connections = {
		-- 				{
		-- 					driver = "postgresql",
		-- 					dataSourceName = "host=127.0.0.1 port=5432 user=simontran database=test ",
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
	end,
}
