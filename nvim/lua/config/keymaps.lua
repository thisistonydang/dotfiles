-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "hh", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("i", "lll", "<Esc>", { desc = "Escape insert mode" })

-- Map <leader>v to vertical split
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Vertical split" })

-- Map <leader>- to horizontal split
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal split" })

-- Move between splits with <leader>h/j/k/l
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to lower split" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to upper split" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right split" })

-- Resize the current split with the arrow keys
vim.keymap.set("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase split height" })
vim.keymap.set("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease split height" })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase split width" })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease split width" })
