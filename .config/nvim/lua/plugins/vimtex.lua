return {
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura_simple"
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

      -- ~/.config/nvim/plugin/vimtex.lua

      -- ~/.config/nvim/plugin/vimtex.lua

      local function get_git_root()
        -- Runs `git rev-parse --show-toplevel` and returns the path, or nil if not found
        local handle = io.popen("git rev-parse --show-toplevel 2>/dev/null")
        if not handle then return nil end
        local result = handle:read("*l")
        handle:close()
        if result and vim.fn.isdirectory(result) == 1 then
          return result
        end
        return nil
      end

      local function find_preamble(git_root)
        -- Searches for preamble.tex in the git root or one of its subdirectories
        local patterns = {
          git_root .. "/preamble.tex",
          git_root .. "/tex/preamble.tex",
          git_root .. "/latex/preamble.tex",
        }

        for _, path in ipairs(patterns) do
          if vim.fn.filereadable(path) == 1 then
            return path
          end
        end

        -- fallback: recursive search (slower but thorough)
        local cmd = string.format("find %s -maxdepth 3 -type f -name 'preamble.tex' 2>/dev/null | head -n 1", git_root)
        local handle = io.popen(cmd)
        local result = handle:read("*l")
        handle:close()
        if result and #result > 0 then
          return result
        end

        return nil
      end

      -- Auto-set VimTeX root and preamble for all .tex files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
          local git_root = get_git_root()
          if not git_root then
            vim.notify("No Git root found. Using current directory as VimTeX root.", vim.log.levels.WARN)
            return
          end

          local preamble_path = find_preamble(git_root)
          vim.b.vimtex_root_dir = git_root

          if preamble_path then
            vim.b.vimtex_preamble = preamble_path
            -- vim.notify("VimTeX root: " .. git_root .. "\nPreamble: " .. preamble_path, vim.log.levels.INFO)
          else
            -- vim.notify("Preamble not found under Git root: " .. git_root, vim.log.levels.WARN)
          end

          -- Optional: set working directory to git root
          -- vim.cmd("lcd " .. git_root)
        end,
      })

      vim.keymap.set("n", "<localleader>ep", function()
        -- Read the buffer-local variable set by your FileType autocommand
        local preamble_file = vim.b.vimtex_preamble

        if preamble_file and #preamble_file > 0 then
          vim.cmd("edit " .. preamble_file)
        else
          vim.notify(
            "Preamble not found (vim.b.vimtex_preamble not set for this buffer).",
            vim.log.levels.WARN
          )
        end
        -- Fix 1: Use 'end' to close the function, not '}'
      end, { desc = "Edit LaTeX Preamble" }) -- Optional: Added a description

    end
  }
}
