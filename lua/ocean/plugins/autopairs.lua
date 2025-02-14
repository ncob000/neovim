return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = true, -- Usa treesitter para decidir cuándo habilitar.
      ts_config = {
        lua = { "string", "source" }, -- Ajusta para Lua.
        javascript = { "template_string" }, -- Ajusta para JavaScript.
        java = false, -- Deshabilita en Java.
        python = { "string", "fstring" }, -- Soporte para Python.
      },
      disable_filetype = { "TelescopePrompt", "vim", "markdown" }, -- Archivos donde no se habilitará.
      fast_wrap = {
        map = "<C-e>", -- Cambia la tecla rápida (opcional).
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        offset = 0, -- Ajusta la posición del cursor tras envolver.
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    })

    -- Integración con nvim-cmp para completar pares automáticamente.
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- Configuración adicional (opcional) para evitar errores con otras herramientas.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown" }, -- Ejemplo: deshabilitar autopairs en Markdown.
      callback = function()
        require("nvim-autopairs").disable()
      end,
    })
  end,
}

