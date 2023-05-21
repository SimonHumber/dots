-- import comment plugin safely
require("nvim_comment").setup({ create_mappings = false })
local setup, comment = pcall(require, "nvim_comment")
if not setup then
	return
end
