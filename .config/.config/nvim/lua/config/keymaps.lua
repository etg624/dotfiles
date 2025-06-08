-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Yank all
vim.keymap.set("n", "<leader>y", ": :%y<CR>", { desc = "Yank all" })
vim.keymap.set("n", "==", "ggVG<CR>", { desc = "Select all" })
-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')
-- Delete text to " register
vim.keymap.set("n", "<leader>d", '"_d', { desc = 'Delete into " register' })
vim.keymap.set("v", "<leader>d", '"_d', { desc = 'Delete into " register' })
