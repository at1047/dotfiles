-- Leader key
vim.g.mapleader = " "

-- Normal mode
vim.keymap.set("n", "O", "O<Esc>")
vim.keymap.set("n", "o", "o<Esc>")

-- Visual mode
vim.keymap.set("v", "<C-c>", '"*y') -- copy to system clipboard

-- Move selected lines up/down and re-indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

