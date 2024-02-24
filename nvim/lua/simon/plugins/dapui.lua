local setup, dapui = pcall(require, "dapui")
if not setup then
	return
end
require("mason-nvim-dap").setup()
require("dap-python").setup("/Users/simontran/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

dapui.setup()
