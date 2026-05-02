vim.g.mapleader = " "
local keymap = vim.keymap.set

keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- equalize split windows
-- Navigate windows using Ctrl + hjkl
keymap('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
-- Tab Management
keymap("n", "<leader>t", ":tabnew<CR>")
keymap("n", "<leader><TAB>", ":tabn<CR>")
keymap("n", "<leader>`", ":tabp<CR>")

-- Create linebreaks
keymap("n", "<CR>", "o<ESC>")
keymap("n", "<S-CR>", "O<ESC>")

-- Center page
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- Telescope Commands (String style)
keymap('n', '<leader>ff', ":Telescope find_files<CR>")
keymap('n', '<leader>fs', ":Telescope live_grep<CR>")

-- Show the error message in a floating window
keymap('n', '<leader>ge', vim.diagnostic.open_float)
-- Format
keymap('n', '<leader>;', vim.lsp.buf.format)

-- Hover definition
keymap("n", "<leader>gh", vim.lsp.buf.hover)
keymap('n', '<leader>gd', vim.lsp.buf.definition)
keymap("n", "<leader>gr", vim.lsp.buf.references)
keymap("n", "<leader>N", vim.diagnostic.goto_prev)
keymap("n", "<leader>n", vim.diagnostic.goto_next)
keymap("n", "<space>gl", vim.diagnostic.setloclist)

vim.api.nvim_create_user_command('LspInfo', 'checkhealth vim.lsp', {})

-- Manual refresh: check disk and redraw
vim.keymap.set('n', '<Esc>', function()
    vim.schedule(function()
        vim.cmd('checktime')
    end)
    return '<Esc>'
end, { expr = true, silent = true })
