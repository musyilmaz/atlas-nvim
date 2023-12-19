vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }


keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

keymap.set("n", "<S-l>", ":bnext<cr>", opts, { desc = "Move to next buffer" })
keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "Move to previous buffer" })
keymap.set("n", "<leader>cb", ":Bdelete!<cr>", opts)

keymap.set("n", "<Left>", ":echoe 'use h'<cr>", opts)
keymap.set("n", "<Right>", ":echoe 'use l'<cr>", opts)
keymap.set("n", "<Up>", ":echoe 'use k'<cr>", opts)
keymap.set("n", "<Down>", ":echoe 'use j'<cr>", opts)
keymap.set("i", "<Left>", "<ESC>:echoe 'use h'<cr>", opts)
keymap.set("i", "<Right>", "<ESC>:echoe 'use l'<cr>", opts)
keymap.set("i", "<Up>", "<ESC>:echoe 'use k'<cr>", opts)
keymap.set("i", "<Down>", "<ESC>:echoe 'use j'<cr>", opts)

keymap.set("i", "jk", "<ESC>", opts, { desc = "Exit insert mode with jk" })
keymap.set("i", ";'", "<ESC>la", opts, { desc = "Move cursor right" })
keymap.set("i", "';", "<ESC>i", opts, { desc = "Move cursor left" })

keymap.set("n", "<leader>w", ":w<cr>", opts, { desc = "Write current buffer" })

keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", opts, { desc = "Move selection up" })
keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", opts, { desc = "Move selection down" })
