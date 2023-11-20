vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.updatetime = 300
vim.o.termguicolors = true
vim.o.mouse = "a"

local map = vim.keymap.set

map("n", "<C-n>", "<cmd>Neotree toggle last<cr>")
map("n", "<C-h>", "<cmd>Neotree focus<cr>")
map("n", "<leader>h", "<cmd>ToggleTerm direction=float<cr>")
