-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set leader key to space (must be set before plugins load)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Don't conceal markup (LazyVim defaults to 2, which hides ** for bold/italic)
vim.opt.conceallevel = 0

-- Don't highlight the line under the cursor
vim.opt.cursorline = false
