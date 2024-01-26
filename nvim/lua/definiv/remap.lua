vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.write)

-- move selected lines up/down and indent correctly
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep selected lines when moving left/right
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- keep cursor in place while joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor mid-screen when navigating up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- replace all occurences of current word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- resize splits with alt + hjkl
vim.keymap.set("n", "<M-h>", "<C-w>>")
vim.keymap.set("n", "<M-j>", "<C-w>-")
vim.keymap.set("n", "<M-k>", "<C-w>+")
vim.keymap.set("n", "<M-l>", "<C-w><")

vim.keymap.set("n", "Q", "<Nop>")
