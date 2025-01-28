return {
    "folke/tokyonight.nvim",
    "xiyaowong/transparent.nvim",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme tokyonight")
        vim.cmd("TransparentEnable")
        require('transparent').clear_prefix('BufferLine')
        require('transparent').clear_prefix('LuaLine')
    end
}
