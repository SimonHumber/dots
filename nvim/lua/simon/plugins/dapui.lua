local setup, dapui = pcall(require, "dapui")
if not setup then
	return
end
require("mason-nvim-dap").setup()
require("dap-python").setup("/Users/simontran/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

dapui.setup()
require("dap").adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		-- 💀 Make sure to update this path to point to your installation
		args = {
			"/Users/simontran/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
			"${port}",
		},
	},
}
require("dap").configurations.javascript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
}
