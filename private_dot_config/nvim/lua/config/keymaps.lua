-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>ug", ":Glow<CR>", { desc = "Preview Markdown with Glow" })
vim.keymap.set("n", "x", '"_x')
-- vim.keymap.set("n", "<C-A>", "gg<S-v>G")
