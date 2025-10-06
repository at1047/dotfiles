return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
      styles = {
        sidebars = "transparent",
        float = "transparent",
      },
    },
  },
  {"neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        transparent_background_level = 2,
        -- Your config here
      })
    end,
  },
  -- {
  --   "sainnhe/everforest",
  --   lazy = false,
  --   name = "everforest",
  --   opts = {},
  -- }
}
