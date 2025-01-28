vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

vim.opt.list = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.hlsearch = false
opt.incsearch = true

opt.backspace = "indent,eol,start"

opt.clipboard = "unnamedplus"
opt.smartindent = true
opt.colorcolumn = ""
opt.isfname:append("@-@")
opt.splitright = true
opt.splitbelow = true

opt.hidden = true  -- Permite cambiar de buffer sin necesidad de guardarlo.
opt.autoread = true  -- Actualiza automáticamente el archivo si es modificado externamente.
opt.updatetime = 300  -- Reduce el tiempo para eventos como el guardado automático.

opt.mouse = "a"  -- Habilita el uso del ratón en todas las áreas.
opt.timeoutlen = 300  -- Reduce el tiempo para que Neovim detecte combinaciones de teclas.
opt.undofile = true  -- Activa el historial de deshacer persistente.
opt.swapfile = false  -- Desactiva los archivos de intercambio.
opt.completeopt = { "menuone", "noselect" }  -- Mejora la experiencia de autocompletado.

opt.showmode = false  -- Oculta el mensaje del modo, ya que se suele usar una barra de estado.
opt.laststatus = 3  -- Usa una barra de estado global en lugar de una por ventana.
opt.list = true  -- Muestra caracteres invisibles como espacios y tabulaciones.
opt.listchars = { tab = "→ ", space = "·", eol = "↲", trail = "•" }
opt.fillchars = { eob = " " }  -- Limpia las líneas vacías al final del buffer.
opt.pumheight = 10  -- Limita la altura del menú de autocompletado.

opt.wildmode = "longest:full,full"  -- Mejora el comportamiento del completado en línea de comandos.
opt.wildignore = { "*.o", "*.obj", "*.bin", "*.exe", "*.jpg", "*.png", "*.gif", "*.zip", "*.tar.gz" }

opt.lazyredraw = true  -- Mejora el rendimiento al ejecutar macros o movimientos grandes.
opt.shortmess:append("c")  -- Evita mensajes redundantes en el área de comandos.
opt.formatoptions:remove({ "c", "r", "o" })  -- Desactiva comentarios automáticos en nuevas líneas.


