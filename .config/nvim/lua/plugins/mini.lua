return {
{ -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup({
        mappings = {
          add = 'ys', -- Add surrounding in Normal and Visual modes
          delete = 'ds', -- Delete surrounding
          --  find = 'sf', -- Find surrounding (to the right)
          --  find_left = 'sF', -- Find surrounding (to the left)
          --  highlight = 'sh', -- Highlight surrounding
          replace = 'cs', -- Replace surrounding

          -- suffix_last = 'l', -- Suffix to search with "prev" method
          -- suffix_next = 'n', -- Suffix to search with "next" method
        },
      })
      require('mini.pairs').setup()
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
