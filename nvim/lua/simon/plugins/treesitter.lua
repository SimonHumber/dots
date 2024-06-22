return {
	{ -- import nvim-treesitter plugin safely
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = { "windwp/nvim-ts-autotag" },

		-- configure treesitter
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				-- per_filetype = {
				-- 	["html"] = {
				-- 		enable_close = false,
				-- 	},
				-- },
			})
			treesitter.setup({
				-- 	-- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- 	-- disabled indentation because does not work well with pyright lsp auto-indent
				indent = { enable = false },
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
