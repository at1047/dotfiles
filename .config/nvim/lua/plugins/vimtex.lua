return {
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_compiler_latexmk = {
        continuous = 1,
        options = {
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
        },
      }

      local autocmd_group = vim.api.nvim_create_augroup("VimtexUserAutocmds", { clear = true })

      vim.api.nvim_create_autocmd("User", {
        pattern = "VimtexEventQuit",
        command = "VimtexClean",
        group = autocmd_group,
        desc = "Clean up latexmk files on VimTeX quit",
      })

      -- vim.api.nvim_create_augroup("vimtex_event_1", { clear = true })

      -- vim.api.nvim_create_autocmd("User", {
      --   group = "vimtex_event_1",
      --   pattern = "VimtexEventCompileSuccess",
      --   callback = function()
      --     vim.cmd("VimtexView")
      --   end,
      -- })

      -- Get Vim's window ID (once per session)
      if vim.g.vim_window_id == nil then
        vim.g.vim_window_id = vim.fn.system("xdotool getactivewindow"):gsub("%s+", "")
      end

      -- Define the focus function
      local function tex_focus_vim()
        -- Give the window manager time to process focus changes
        vim.defer_fn(function()
          -- Refocus Vim and redraw
          vim.fn.system("xdotool windowfocus " .. vim.g.vim_window_id)
          vim.cmd("redraw!")
        end, 200) -- 200 milliseconds
      end

      -- Create augroup and autocmd for VimtexEventView
      vim.api.nvim_create_augroup("vimtex_event_focus", { clear = true })

      vim.api.nvim_create_autocmd("User", {
        group = "vimtex_event_focus",
        pattern = "VimtexEventView",
        callback = tex_focus_vim,
      })


    end
  }
}
