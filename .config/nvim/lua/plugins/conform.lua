-- ~/.config/nvim/lua/plugins/conform.lua

return {
  'stevearc/conform.nvim',
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true }, function(err)
          if not err then
            local formatters = require("conform").list_formatters(0)
            local formatter_names = {}
            for _, f in ipairs(formatters) do
              table.insert(formatter_names, f.name)
            end
            
            vim.notify(
              "Formatted with: " .. table.concat(formatter_names, ", "),
              vim.log.levels.INFO,
              { title = "Conform" }
            )
          end
        end)
      end,
      mode = "",
      desc = "Format buffer",
    },
  },  
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      -- Added for your Vue/Markdown workflow:
      vue = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      tex = { "latexindent" },
    },
  },
}
