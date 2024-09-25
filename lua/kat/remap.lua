vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

-- used to move around blocks of code in visual mode
vim.keymap.set("v","J", ":m'>+1<CR>gv=gv")
vim.keymap.set("v","K", ":m'<-2<CR>gv=gv")

-- used for keeping the cursor in place when searching or jumping or moving items in order to be less disorenting
vim.keymap.set("n", "J","mzJ`z")
vim.keymap.set("n", "<C-d>","<C-d>zz")
vim.keymap.set("n", "<C-u>","<C-u>zz")
vim.keymap.set("n", "n","nzzzv")
vim.keymap.set("n", "N","Nzzzv")

--used to keep the current word that is copied in vim
vim.keymap.set("x","<leader>p","\"_dP")

--used to seperate out the yank functions that allow them to be copied to the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

--used to delet stuff and have it be deleted in a void reg
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--used to make <C-c> equivalent to <Esc>
vim.keymap.set("i", "<C-c>", "<Esc>")

--some quality of life stuff 
vim.keymap.set("n", "Q", "<nop>")

--used  to change project directorys 
vim.keymap.set("n", "<C-f>", "<cmd> silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n","<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
