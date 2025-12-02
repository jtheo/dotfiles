-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>ug", ":Glow<CR>", { desc = "Preview Markdown with Glow" })
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<leader>hh", ":Hardtime toggle<CR>", { desc = "Toggle Hard Time" })
vim.keymap.set("n", "<leader>hp", ":Precognition toggle<CR>", { desc = "Toggle Hard Time" })
