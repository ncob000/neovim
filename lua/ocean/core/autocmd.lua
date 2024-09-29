local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('bufcheck', {clear = true})

augroup('SaveTrigger', { clear = true })
autocmd('BufWritePost', {
	command = ':lua vim.lsp.buf.format()'
})

autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})
    autocmd('TermOpen',     {
        group    = 'bufcheck',
        pattern  = '*',
        command  = 'startinsert | set winfixheight'})
autocmd('TermOpen', {
  group = 'bufcheck',
  pattern  = '*',
  command  = 'startinsert | set winfixheight'
})


