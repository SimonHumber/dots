local setup, dapui = pcall(require, "dapui")
if not setup then
	return
end
require("mason-nvim-dap").setup()
require("dap-python").setup("/Users/simontran/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

dapui.setup()
local dap = require("dap")
dap.set_log_level("DEBUG")
dap.adapters["pwa-node"] = {
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
dap.configurations.javascript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
}
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/local/cellar/llvm/17.0.6_1/bin/lldb-vscode",
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},

		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		-- runInTerminal = false,
	},
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
