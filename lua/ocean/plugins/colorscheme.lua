return {
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        priority = 1000, -- Asegura que se cargue antes de otros esquemas de color
        config = function()
            require("transparent").setup({
                enable = true,
                extra_groups = {
                    "NormalFloat",
                    "NvimTreeNormal",
                    "TelescopeNormal",
                },
            })
        end,
    },

    {
        "Mofiqul/vscode.nvim",
        lazy = false, -- Se carga inmediatamente para evitar flickering en el esquema de color
        priority = 1000, -- Asegura que se cargue antes de otros plugins
        config = function()
            vim.o.background = "dark"

            local c = require("vscode.colors").get_colors()
            require("vscode").setup({
                transparent = true, -- Activa el fondo transparente
                italic_comments = true, -- Comentarios en itálica
                underline_links = true, -- Subrayar enlaces
                disable_nvimtree_bg = true, -- Evita fondo en NvimTree

                -- 🎨 Personalización de colores
                color_overrides = {
                    vscLineNumber = "#FFFFFF", -- Color de los números de línea
                },

                group_overrides = {
                    Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
                },
            })

            -- 🔹 Aplicar esquema de color
            vim.cmd("colorscheme vscode")
        end,
    },
}

