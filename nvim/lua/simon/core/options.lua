local opt = vim.opt -- for conciseness

opt.guicursor = "i:block"

-- line numbers
opt.relativenumber = false
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
local function is_txt_file(filename)
	return filename:match("%.txt$") ~= nil
end
if is_txt_file(vim.fn.expand("%:t")) then
	opt.wrap = true
else
	opt.wrap = false
end

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

--appearance
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
