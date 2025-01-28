-- Establecer líder
vim.g.mapleader = " "

local keymap = vim.keymap

-- Guardar y salir
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "Quit all buffers" })

-- Mover texto en modo visual
keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv", { desc = "Move text up in visual mode" })
keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv", { desc = "Move text down in visual mode" })

-- ToggleTerm
keymap.set("n", "<leader>ot", ":ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Salir del modo insert con 'jk'
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Borrar resaltados de búsqueda
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Incrementar y decrementar números
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Dividir ventanas
keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Pestañas
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", ":tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Redimensionar ventanas
keymap.set("n", "+", ":vertical resize +5<CR>", { desc = "Make the window bigger vertically" })
keymap.set("n", "-", ":vertical resize -5<CR>", { desc = "Make the window smaller vertically" })
keymap.set("n", "=", ":resize +2<CR>", { desc = "Make the window bigger horizontally" })
keymap.set("n", "*", ":resize -2<CR>", { desc = "Make the window smaller horizontally" })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })

