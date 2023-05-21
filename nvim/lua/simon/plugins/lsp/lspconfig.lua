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
keymap.set("n", "gd", vim.lsp.buf.definition, opts)

--used to enable autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig["html"].setup({
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

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["jdtls"].setup({
	filetypes = { "java" },
	cmd = { "/Users/simontran/.local/share/nvim/mason/packages/jdtls/jdtls" },
	root_dir = lspconfig.util.root_pattern("*.java"),
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

lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
