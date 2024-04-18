return {
	"mfussenegger/nvim-jdtls",
	ft = "java",

	config = function()
		local home = os.getenv("HOME")
		local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = workspace_path .. project_name
		local bundles = {
			vim.fn.glob(
				home
					.. ".local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				1
			),
		}
		-- //for junit, TODO
		vim.list_extend(
			bundles,
			vim.split(
				vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1),
				"\n"
			)
		)
		local status, jdtls = pcall(require, "jdtls")
		if not status then
			return
		end
		local extendedClientCapabilities = jdtls.extendedClientCapabilities

		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
				"-jar",
				vim.fn.glob(
					home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
				),
				"-configuration",
				home .. "/.local/share/nvim/mason/packages/jdtls/config_mac",
				"-data",
				workspace_dir,
			},
			root_dir = require("jdtls.setup").find_root({ "gradlew" }),

			settings = {
				java = {
					signatureHelp = { enabled = true },
					extendedClientCapabilities = extendedClientCapabilities,
					maven = {
						downloadSources = true,
					},
					referencesCodeLens = {
						enabled = true,
					},
					references = {
						includeDecompiledSources = true,
					},
					inlayHints = {
						parameterNames = {
							enabled = "all", -- literals, all, none
						},
					},
					format = {
						enabled = false,
					},
				},
			},

			init_options = {
				bundles = bundles,
			},
		}
		-- require("jdtls").test_class()
		-- require("jdtls").test_nearest_method()
		-- require("jdtls.dap").setup_dap_main_class_configs()

		--must be put in autocmd so lsp attaches on every buffer, not just first
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				require("jdtls").start_or_attach(config)
			end,
		})

		vim.keymap.set("n", "<leader>jr", "<Cmd>JdtWipeData<CR>", { desc = "Wipe data and reset" })
		-- vim.keymap.set("n", "<leader>jr", "<Cmd>JdtRestart<CR>", { desc = "Reset configs" })
		-- vim.keymap.set("n", "<leader>dj", "<Cmd>lua require'jdtls'.test_class()<CR>", { desc = "Organize Imports" })
		-- vim.keymap.set("n", "<leader>dg", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", { desc = "Organize Imports" })
		-- vim.keymap.set('n', '<leader>co', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports' })
		-- vim.keymap.set('n', '<leader>crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = 'Extract Variable' })
		-- vim.keymap.set('v', '<leader>crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = 'Extract Variable' })
		-- vim.keymap.set('n', '<leader>crc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
		-- vim.keymap.set('v', '<leader>crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = 'Extract Constant' })
		-- vim.keymap.set('v', '<leader>crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = 'Extract Method' })
	end,
}
