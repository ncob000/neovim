vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Save file" }) -- save file
keymap.set("n", "<leader>qa", vim.cmd.qa, { desc = "Quit current buffer" })
keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv", { desc = "Move text up in visual mode" })
keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv", { desc = "Move text down in visual mode" })

keymap.set("n", "<leader>ot", ":ToggleTerm <CR>")

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "decrement number" })


keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previus tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current buffer in new tab" })

keymap.set("n", "+", [[<cmd>vertical resize +5<cr>]], { desc = "make the window biger vertically" })
keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]], { desc = "Make the window smaller vertically" })
keymap.set("n", "=", [[<cmd>horizontal resize +2<cr>]],
    { desc = "Make the window bigger horizontally by pressing shift and =" })
keymap.set("n", "*", [[<cmd>horizontal resize -2<cr>]],
    { desc = "make the window smaller horizontally by pressing shift and -" })

keymap.set("n", "<leader>zm", [[<cmd>ZenMode<CR>]], { desc = "Enable/dissable ZenMode" })
