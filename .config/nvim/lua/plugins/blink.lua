return {
  'saghen/blink.cmp',
  version = 'v0.*',
  -- Link LuaSnip as a dependency so it loads first
  dependencies = { 'L3MON4D3/LuaSnip' },

  opts = {
    -- Use 'default' or 'none' since we are defining custom keys
    keymap = {
      preset = 'none',

      -- Logic: Accept completion if menu is open, otherwise jump snippet
      ['<Tab>'] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.accept()
          elseif require("luasnip").expand_or_locally_jumpable() then
            return require("luasnip").expand_or_jump()
          end
        end,
        'fallback',
      },

      ['<S-Tab>'] = {
        function(cmp)
          if require("luasnip").locally_jumpable(-1) then
            return require("luasnip").jump(-1)
          end
        end,
        'fallback',
      },

      -- Your custom navigation
      ['<M-j>'] = { 'select_next', 'fallback' },
      ['<M-k>'] = { 'select_prev', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
    },

    -- Tell blink to use luasnip as the engine
    snippets = {
      preset = 'luasnip',
    },

    -- Optional: Define your sources
    sources = {
      default = { 'snippets', 'lsp', 'path', 'buffer' },
      providers = {
        snippets = {
          score_offset = 100, -- Boost snippets to the top
        },
        lsp = {
          score_offset = 0,
        },
      },
    },

  },
}
