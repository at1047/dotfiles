return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()

    require("gitsigns").setup({
      base = "index",
      signs_staged_enable = false,
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local show_review_overlay = false

        local function toggle_review_overlay_mode()
          -- Keep diff source pinned to unstaged-only (working tree vs index).
          gs.reset_base()
          show_review_overlay = not show_review_overlay
          gs.toggle_linehl(show_review_overlay)
          gs.toggle_deleted(show_review_overlay)

          if show_review_overlay then
            print("[Gitsigns] Review overlay: ON")
          else
            print("[Gitsigns] Review overlay: OFF")
          end

          gs.refresh()
        end

        -- Always compare against index (unstaged-only).
        gs.change_base()

        vim.keymap.set("n", "<leader>gr", toggle_review_overlay_mode, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr })
      end,
    })
  end,
}
