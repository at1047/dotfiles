return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup({
        mappings = {
          add = 'ys', 
          delete = 'ds', 
          replace = 'cs',
        },
      })
      require('mini.pairs').setup()
      -- Setup mini.diff
      require('mini.diff').setup()

      -- --- MINI.DIFF KEYBINDS & LOGIC ---

      -- Add (green) — already tuned
      vim.api.nvim_set_hl(0, "MiniDiffOverAdd", {
        fg = "#9ece6a",
        bg = "#264d36",
      })

      -- Change (amber) — push slightly toward orange to avoid green/blue mixing
      vim.api.nvim_set_hl(0, "MiniDiffOverChange", {
        fg = "#e0af68",
        bg = "#3a2f1f",
      })

      -- Delete (red) — warm it up so it doesn’t turn magenta/purple
      vim.api.nvim_set_hl(0, "MiniDiffOverDelete", {
        fg = "#f7768e",
        bg = "#3a1f24",
      })

      -- Optional: make changed text inside lines clearer
      vim.api.nvim_set_hl(0, "MiniDiffOverChangeBuf", {
        fg = "#e0af68",
        underline = true,
      })

      local function toggle_review_overlay_mode()
        local bufnr = vim.api.nvim_get_current_buf()
        -- Toggle our custom state tracking variable
        local show = not (vim.b[bufnr].minidiff_review_overlay or false)
        vim.b[bufnr].minidiff_review_overlay = show

        -- Toggle the actual mini.diff overlay for this buffer
        require('mini.diff').toggle_overlay(bufnr)

        -- Apply the visual indicators
        if show then
          print("[mini.diff] Review overlay: ON")
          vim.cmd('hi StatusLine guibg=#2e3b30')
        else
          print("[mini.diff] Review overlay: OFF")
          -- Revert to your colorscheme's default StatusLine background. 
          -- Note: If 'NONE' makes it transparent and you want your standard 
          -- theme color back, you might need to link it back to your theme's default!
          vim.cmd('hi StatusLine guibg=NONE')
        end
      end

      -- Map the new toggle function
      vim.keymap.set('n', '<leader>gr', toggle_review_overlay_mode, { desc = 'Toggle mini.diff overlay & indicator' })

      -- Stage (apply) hunk: maps to the built-in 'ghgh' keystrokes
      vim.keymap.set('n', '<leader>hs', 'ghgh', { remap = true, desc = 'Stage Hunk' })

      -- Reset hunk: maps to the built-in 'gHgh' keystrokes
      vim.keymap.set('n', '<leader>hr', 'gHgh', { remap = true, desc = 'Reset Hunk' })

    end,
  },
}
