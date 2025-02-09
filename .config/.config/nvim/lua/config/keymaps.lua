-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Select all
vim.keymap.set("n", "==", "gg0<S-v>G")
-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')
-- Copy text to " register
vim.keymap.set("n", "<leader>y", '"+y', { desc = 'Yank into " register' })
vim.keymap.set("v", "<leader>y", '"+y', { desc = 'Yank into " register' })
-- Delete text to " register
vim.keymap.set("n", "<leader>d", '"_d', { desc = 'Delete into " register' })
vim.keymap.set("v", "<leader>d", '"_d', { desc = 'Delete into " register' })
-- Jump to plugin management file
vim.keymap.set("n", "gn", ":Neogit kind=floating<CR>", { desc = "Open Neogit" })
vim.keymap.set("n", "<C-p>", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })
