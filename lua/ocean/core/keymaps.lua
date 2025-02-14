-- Establecer líder
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

-- 📌 Guardar y salir
keymap("n", "<leader>w", function() vim.cmd("w") end, { desc = "Save file" })
keymap("n", "<leader>qa", function() vim.cmd("qa") end, { desc = "Quit all buffers" })

-- 📌 Mover texto en modo visual
keymap("v", "<Up>", ":m '<-2<CR>gv=gv", { desc = "Move text up in visual mode", silent = true })
keymap("v", "<Down>", ":m '>+1<CR>gv=gv", { desc = "Move text down in visual mode", silent = true })

-- 📌 ToggleTerm (verifica si está disponible)
keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Open ToggleTerm" })


-- 📌 Salir del modo insert con 'jk'
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- 📌 Borrar resaltados de búsqueda
keymap("n", "<leader>nh", function() vim.cmd("nohlsearch") end, { desc = "Clear search highlights" })

-- 📌 Incrementar y decrementar números
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- 📌 Dividir ventanas
keymap("n", "<leader>sv", function() vim.cmd("vsplit") end, { desc = "Split window vertically" })
keymap("n", "<leader>sh", function() vim.cmd("split") end, { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", function() vim.cmd("close") end, { desc = "Close current split" })

-- 📌 Pestañas
keymap("n", "<leader>to", function() vim.cmd("tabnew") end, { desc = "Open new tab" })
keymap("n", "<leader>tx", function() vim.cmd("tabclose") end, { desc = "Close current tab" })
keymap("n", "<leader>tn", function() vim.cmd("tabnext") end, { desc = "Go to next tab" })
keymap("n", "<leader>tp", function() vim.cmd("tabprev") end, { desc = "Go to previous tab" })
keymap("n", "<leader>tf", function() vim.cmd("tabnew %") end, { desc = "Open current buffer in new tab" })

-- 📌 Redimensionar ventanas
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +5<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -5<CR>", opts)

-- 📌 Movimiento entre ventanas
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })

