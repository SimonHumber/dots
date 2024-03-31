-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	-- disabled indentation because does not work well with pyright lsp auto-indent
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
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
	-- auto install above language parsers
	auto_install = true,
})
