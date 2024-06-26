-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
		require("Comment").setup({

			---Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = " /",
				---Block-comment toggle keymap
				block = " /",
				--
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				-- line = " /",
				---Block-comment keymap
				block = " /",
			},
			---LHS of extra mappings,currently disabled
			extra = {
				---Add comment on the line above
				above = "gcO",
				---Add comment on the line below
				below = "gco",
				---Add comment at the end of line
				eol = "gcA",
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = false,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = false,
			},
			---Function to call before (un)comment
			pre_hook = ts_context_commentstring.create_pre_hook(),
			---Function to call after (un)comment
			post_hook = nil,
		})
	end,
}
