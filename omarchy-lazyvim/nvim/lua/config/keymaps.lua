-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Ctrl-P → Find files (same as <leader><leader>)
map("n", "<C-p>", "<leader>ff", { remap = true, desc = "Find Files" })

-- Ctrl-F → Live grep (same as <leader>/)
map("n", "<C-f>", "<leader>/", { remap = true, desc = "Live Grep" })

-- Space Space → Switch buffer (same as <leader>b b)
map("n", "<leader><leader>", "<leader>bb", { remap = true, desc = "Switch Buffer" })
