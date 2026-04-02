return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = false,
      numhl = false,
      linehl = false,
      current_line_blame = false,
      word_diff = false,

      -- optional: avoid staged markers entirely
      signs_staged_enable = false,

      -- optional: prevent default mappings if you truly only want backend use
      on_attach = function(_) end,
    },
  },

  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "lewis6991/gitsigns.nvim",
    },
    opts = {
      handlers = {
        diagnostic = false,
        search = false,
        cursor = false,
        gitsigns = true,
      },
      marks = {
        GitAdd    = { text = "▎" },
        GitChange = { text = "▎" },
        GitDelete = { text = "▎" }
      }
    },
    config = function(_, opts)
      require("scrollbar").setup(opts)
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
}
