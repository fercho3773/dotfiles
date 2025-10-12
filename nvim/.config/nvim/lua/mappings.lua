require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- GENERAL
-- GENERAL
-- GENERAL
-- Save with Ctr+S
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save File Ctrl+S" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
