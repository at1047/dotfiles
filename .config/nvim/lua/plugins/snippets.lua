return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- follow latest release
    build = "make install_jsregexp", -- optional for regex
    config = function()
      local ls = require("luasnip")

      -- Load custom snippets
      require("luasnip.loaders.from_lua").load({
        paths = '~/.config/nvim/LuaSnip/',
      })

      require("luasnip").config.set_config({
        enable_autosnippets = true,
      })

      -- Tab and Shift-Tab for jumping
      vim.cmd([[
        " Use Tab to expand and jump through snippets
        imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
        smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

        " Use Shift-Tab to jump backwards through snippets
        imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
        smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
        ]])
    end,
  },
}

