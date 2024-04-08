return {
	{ -- import nvim-treesitter plugin safely
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = { "windwp/nvim-ts-autotag" },

		-- configure treesitter
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				-- 	-- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- 	-- enable indentation
				-- 	-- disabled indentation because does not work well with pyright lsp auto-indent
				indent = { enable = false },
				-- 	-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				-- 	-- ensure these language parsers are installed
				ensure_installed = {
					-- check nvim-treesitter README for languages
					"html",
					"css",
					"c",
					"cpp",
					"java",
					"kotlin",
					"javascript",
					"typescript",
					"tsx",
					"python",
					"bash",
					"lua",
					"sql",
					"gitignore",
				},
				-- auto install language parsers
				auto_install = true,
			})
		end,
	},
}
