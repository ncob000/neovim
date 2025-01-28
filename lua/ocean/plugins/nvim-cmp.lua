return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    "Exafunction/codeium.nvim", -- Añadido Codeium
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Cargar snippets desde VSCode y agregar un fragmento en C
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Usar 'text_node' de luasnip correctamente
    local snippet = luasnip.snippet
    local text_node = luasnip.text_node

    luasnip.add_snippets("c", {
      snippet("init", {
        text_node({
          "#include <stdio.h>",
          "#include <stdlib.h>",
          "#include <string.h>",
          "#include <math.h>",
          "",
          "// ljk<>",
          "",
          "int main() {",
          "   int i, j;",
          "   return 0;",
          "}",
        }),
      }),
    })

    -- Configuración de nvim-cmp
    cmp.setup({
      preselect = "item",  -- Preselección de la primera sugerencia automáticamente
      completion = {
        completeopt = "menu,menuone,preview,noselect",
        select_first_item = true,  -- Hacer que siempre se seleccione la primera sugerencia
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Mapeos para navegación entre completados, y comportamiento adicional.
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<TAB>"] = cmp.mapping.select_next_item(), -- Avanzar en las sugerencias con TAB
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Retroceder en las sugerencias con Shift+TAB
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar selección con Enter
      }),

      -- Fuentes de completado
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "codeium" }, -- Integración de Codeium.
        { name = "buffer" },
        { name = "path" },
      }),

      -- Ventanas de completado y documentación
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      -- Configuración de formato con lspkind para íconos
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

    -- Configuración para cmdline (búsqueda y comando)
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}

