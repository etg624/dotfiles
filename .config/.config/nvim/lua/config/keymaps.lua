-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Select all
vim.keymap.set("n", "==", ": :%y<CR>", { desc = "Select all" })
-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')
-- Delete text to " register
vim.keymap.set("n", "<leader>d", '"_d', { desc = 'Delete into " register' })
vim.keymap.set("v", "<leader>d", '"_d', { desc = 'Delete into " register' })
-- Jump to plugin management file
vim.keymap.set("n", "<C-p>", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })
