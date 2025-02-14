vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- 📌 Numeración relativa y absoluta
opt.relativenumber = true
opt.number = true

-- 📌 Configuración de indentación
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- 📌 Visualización y comportamiento del cursor
opt.wrap = false
opt.cursorline = true
opt.cursorlineopt = "number" -- Resaltar solo el número de línea

-- 📌 Búsqueda inteligente
opt.ignorecase = true
opt.smartcase = true

-- 📌 Mejor experiencia visual
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.hlsearch = false
opt.incsearch = true

-- 📌 Manejo de buffers y archivos
opt.hidden = true    -- Permite cambiar de buffer sin guardar
opt.autoread = true  -- Recargar archivo si cambia externamente
opt.updatetime = 200 -- Reduce el tiempo para eventos como LSP y Git

-- 📌 Configuración del ratón (desactivado si no se usa)
opt.mouse = "a"
-- opt.pumblend = 20
-- 📌 Configuración de ventanas y splits
opt.splitright = true
opt.splitbelow = true

-- 📌 Configuración de autocompletado
opt.completeopt = { "menuone", "noselect" }
opt.pumheight = 10 -- Altura máxima del menú de autocompletado

-- 📌 Comportamiento del backspace
opt.backspace = "indent,eol,start"

-- 📌 Configuración de líneas invisibles
opt.list = true
opt.listchars = { tab = "→ ", eol = "↲", trail = "•" }
opt.fillchars = { eob = " " } -- Eliminar ~ en líneas vacías

-- 📌 Mejora de comandos en línea
opt.wildmode = "longest:full,full"
opt.wildignore = { "*.o", "*.obj", "*.bin", "*.exe", "*.jpg", "*.png", "*.gif", "*.zip", "*.tar.gz" }

-- 📌 Mejoras de rendimiento
opt.lazyredraw = true
opt.shortmess:append("c")
opt.formatoptions:remove({ "c", "r", "o" })

-- 🔹 Función para establecer fondo transparente
local function set_transparent_background()
    local groups = { "Normal", "NonText", "NormalNC", "LineNr" }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
end
set_transparent_background()

vim.cmd([[
  highlight Pmenu guibg=NONE guifg=NONE
  highlight PmenuSel guibg=#3B4252 guifg=#E5E9F0 gui=bold
  highlight FloatBorder guibg=#1E1E2E guifg=#3B4252
]])
