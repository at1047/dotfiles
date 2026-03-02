-- This file should be something like: ~/.config/nvim/lua/plugins/conform.lua

return {
  'stevearc/conform.nvim',
  keys = {
    {
      -- Customize or change the keybind to your preference
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
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
      
      -- ADDED THIS LINE FOR LATEX:
      tex = { "latexindent" },
    },
  },
}
