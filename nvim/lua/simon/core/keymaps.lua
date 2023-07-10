vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- equalize split windows
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>t", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>w", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader><TAB>", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>`", ":tabp<CR>")

--file explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

--fuzzyfinder and telescoper
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
--make sure to brew install livegrep for grep to work
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

--liveserver
keymap.set("n", "<leader>lsg", ":LiveServer start<cr>")
keymap.set("n", "<leader>lss", ":LiveServer stop<cr>")

keymap.set("n", "<leader>p", ":w<CR>:!time python3 %<CR>")

--create linebreaks in normal mode
keymap.set("n", "<CR>", "o<ESC>")
keymap.set("n", "<S-CR>", "O<ESC>")

--comment out single lines
keymap.set("n", "<leader>;", ":CommentToggle<CR>")

--insert mode
keymap.set("i", "<C-b>", "<Left>")
keymap.set("i", "<C-f>", "<Right>")
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-l>", "<Right>")

--toggle term
keymap.set("t", "<esc>", [[<C-\><C-n>]])

--dadbod
keymap.set("n", "<leader>du", ":DBUIToggle<CR>")

--center page when going up and down
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
