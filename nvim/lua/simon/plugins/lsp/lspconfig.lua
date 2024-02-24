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
lspconfig["jdtls"].setup({
	filetypes = { "java" },
	cmd = { "/Users/simontran/.local/share/nvim/mason/packages/jdtls/jdtls" },
	root_dir = lspconfig.util.root_pattern("*.java"),
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
