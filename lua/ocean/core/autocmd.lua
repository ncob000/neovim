local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Crear un grupo para cada conjunto de autocmd relacionados
local bufcheck_group = augroup('BufCheck', { clear = true })
local save_trigger_group = augroup('SaveTrigger', { clear = true })

-- Formatear automáticamente al guardar
autocmd('BufWritePost', {
    group = save_trigger_group,
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})

-- Eliminar espacios en blanco al final antes de guardar
autocmd('BufWritePre', {
    group = save_trigger_group,
    pattern = '*',
    command = [[%s/\s\+$//e]],
})

-- Configuración para terminal
autocmd('TermOpen', {
    group = bufcheck_group,
    pattern = '*',
    command = 'startinsert | setlocal winfixheight',
})

-- Actualizar automáticamente el archivo si se modifica desde fuera de Neovim
autocmd({ 'FocusGained', 'BufEnter' }, {
    group = bufcheck_group,
    pattern = '*',
    command = 'checktime',
})

-- Resaltar automáticamente texto que se copia al portapapeles
autocmd('TextYankPost', {
    group = bufcheck_group,
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
    end,
})

-- Cambiar automáticamente a número absoluto en modo normal y relativo en modo insert
autocmd('InsertEnter', {
    group = bufcheck_group,
    command = 'set norelativenumber',
})
autocmd('InsertLeave', {
    group = bufcheck_group,
    command = 'set relativenumber',
})

-- Cerrar automáticamente el terminal con `<Esc>` y guardar tamaño de ventana
autocmd('TermOpen', {
    group = bufcheck_group,
    pattern = '*',
    callback = function()
        vim.cmd('nnoremap <buffer> <Esc> :close<CR>')
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.opt.list = false -- Desactiva los caracteres de espacio visibles al iniciar Neovim
    end,
})

