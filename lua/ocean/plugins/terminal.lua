return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0, -- Ajuste para mejorar transparencia
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })

        function _G.set_terminal_keymaps()
            local opts = { noremap = true, buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
            vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
            vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
            vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
        end

        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
        function _LAZYGIT_TOGGLE() lazygit:toggle() end

        local node = Terminal:new({ cmd = "node", hidden = true })
        function _NODE_TOGGLE() node:toggle() end

        local python = Terminal:new({ cmd = "python3", hidden = true })
        function _PYTHON_TOGGLE() python:toggle() end

        -- Keymaps para abrir terminales personalizadas
        vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Open LazyGit" })
        vim.keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", { desc = "Open Node REPL" })
        vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", { desc = "Open Python REPL" })
    end,
}

