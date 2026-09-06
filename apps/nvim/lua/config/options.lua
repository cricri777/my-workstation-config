require("config.remote_clipboard").setup()
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

-- This setting directs all default "yank" (y) and "put" (p) operations to use the system clipboard (+ register).
vim.opt.clipboard = "unnamedplus"
