return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        lualine.setup({
            options = {
                theme = "vscode",
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true, -- Usa la barra de estado como una barra global
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { { 'filename', path = 1, symbols = { modified = '[+]', readonly = '[-]' } } },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', file_status = true, path = 2 } }, -- Nombre del archivo con ruta completa
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = { 'nvim-tree', 'quickfix', 'fugitive' }, -- Agregar integraciones adicionales
        })
    end,
}
