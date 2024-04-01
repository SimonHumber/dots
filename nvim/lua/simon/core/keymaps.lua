vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- equalize split windows
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- close current split window
keymap.set("n", "<leader>sb", ":set scb!<CR>") -- close current split window

keymap.set("n", "<leader>t", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>w", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader><TAB>", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>`", ":tabp<CR>")

--file explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>fe", ":NvimTreeFindFile<CR>")

--fuzzyfinder and telescoper
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
--make sure to brew install ripgrep for grep to work
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

--create linebreaks in normal mode
keymap.set("n", "<CR>", "o<ESC>")
keymap.set("n", "<S-CR>", "O<ESC>")

--comment
keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

--toggle term
keymap.set("t", "<esc>", [[<C-\><C-n>]])

--center page when going up and down
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

--dap
keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<CR>")
keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>")
keymap.set("n", "<leader>dc", ":DapContinue<CR>")
keymap.set("n", "<leader>o", ":DapStepOver<CR>")
keymap.set("n", "<leader>i", ":DapStepIn<CR>")
keymap.set("n", "<leader>do", ":DapStepOut<CR>")

keymap.set("", "<ScrollWheelRight>", "<Nop>", { noremap = true, silent = true })
keymap.set("", "<ScrollWheelLeft>", "<Nop>", { noremap = true, silent = true })

--dadbod
keymap.set("n", "<leader>da", ":DBUIToggle<CR>")
