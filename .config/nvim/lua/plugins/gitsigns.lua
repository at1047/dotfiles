return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    local gs_group = vim.api.nvim_create_augroup('GitsignsExternalSync', { clear = true })

    require("gitsigns").setup({
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

        local function toggle_review_overlay_mode()
          local show = not (vim.b[bufnr].gitsigns_review_overlay or false)
          vim.b[bufnr].gitsigns_review_overlay = show
          gs.toggle_linehl(show)
          gs.toggle_deleted(show)

          if show then
            print("[Gitsigns] Review overlay: ON")
            vim.cmd('hi StatusLine guibg=#2e3b30')
          else
            print("[Gitsigns] Review overlay: OFF")
            vim.cmd('hi StatusLine guibg=NONE')
          end
        end

        vim.keymap.set("n", "<leader>gr", toggle_review_overlay_mode, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr })
      end,
    })

    -- :e! replaces buffer content but doesn't fire TextChanged, so gitsigns
    -- never re-diffs. Emit TextChanged after the reload to nudge it.
    vim.api.nvim_create_autocmd('BufReadPost', {
      group = gs_group,
      callback = function(args)
        if not package.loaded.gitsigns then return end
        if vim.bo[args.buf].buftype ~= '' then return end
        if not vim.b[args.buf].gitsigns_head then return end
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(args.buf) then
            vim.api.nvim_exec_autocmds('TextChanged', { buffer = args.buf })
          end
        end)
      end,
    })
  end,
}
