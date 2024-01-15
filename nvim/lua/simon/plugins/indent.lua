require("ibl").setup({
	-- for example, context is off by default, use this to turn it on
	--	show_current_context = true,
	--	show_current_context_start = false,
})
local setup, indent = pcall(require, "indent")
if not setup then
	return
end
