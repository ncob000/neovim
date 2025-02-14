return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configurar linters por tipo de archivo
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      lua = { "luacheck" }, -- 🔹 Ejemplo: Agregar linters adicionales
      markdown = { "markdownlint" },
    }

    -- Grupo de autocmd para linting
    local lint_augroup = vim.api.nvim_create_augroup("LintOnSave", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Mapeos para linting
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
      vim.notify("Linting completed for current file!", vim.log.levels.INFO)
    end, { desc = "Trigger linting for current file" })

    vim.keymap.set("n", "<leader>la", function()
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        lint.try_lint(bufnr)
      end
      vim.notify("Linting completed for all open buffers!", vim.log.levels.INFO)
    end, { desc = "Trigger linting for all open files" })
  end,
}

